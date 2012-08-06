# twitter_adapter_spec.rb
require_relative '../lib/business/adapter/twitter_adapter'
require_relative '../lib/helper/DAO'
#require 'redis'

describe TwitterAdapter do
  describe "#connect_stream" do
    it "returns a status that was retrieved from the TwitterStream API" do

		dao = DAO.new 'twitter'
		prev = dao.size

		a = Thread.new { adapter = TwitterAdapter.new; adapter.connect_stream; puts 'retrieving...' ;}
		a.run
		a.join 5
		Thread.kill(a)
		post = dao.size
	
		post = post-prev
		post.should > 0

    end
  end
end
