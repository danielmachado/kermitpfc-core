# twitter_adapter_spec.rb
require_relative '../business/adapter/twitter_adapter'
require 'redis'

describe TwitterAdapter do
  describe "#connect_stream" do
    it "returns a status that was retrieved from the TwitterStream API" do

    	@config = YAML::load( File.open( '../config.yml' ) )

    	@db = Redis.new
		@db = Redis.connect(
			:db   => "#{@config["redis"]["db"]}",
			:host => "#{@config["redis"]["host"]}",
			:port => @config["redis"]["port"]
		)
		prev = @db.llen 'tweets'

		a = Thread.new { adapter = TwitterAdapter.new 'test'; adapter.connect_stream; puts 'retrieving...' ;}
		a.run
		a.join 5
		Thread.kill(a)
		post = @db.llen 'tweets'
	
		post = post-prev
		post.should > 0

    end
  end
end
