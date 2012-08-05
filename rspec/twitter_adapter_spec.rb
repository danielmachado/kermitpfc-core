# twitter_adapter_spec.rb
require_relative '../business/adapter/twitter_adapter'
require_relative '../helper/DAO'
#require 'redis'

describe TwitterAdapter do
  describe "#connect_stream" do
    it "returns a status that was retrieved from the TwitterStream API" do

		dao = DAO.new 'twitter', true
		prev = dao.size

		a = Thread.new { adapter = TwitterAdapter.new true; adapter.connect_stream; puts 'retrieving...' ;}
		a.run
		a.join 5
		Thread.kill(a)
		post = dao.size
	
		post = post-prev
		post.should > 0

    end
  end
end
