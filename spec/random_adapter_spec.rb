# random_adapter_spec.rb

require_relative '../lib/business/adapter/random_adapter'
require_relative '../lib/helper/DAO'

describe RandomAdapter do
  describe "#connect_stream" do
    it "returns a status that was retrieved from the RandomPhraseGenerator Stream" do

		dao = DAO.new 'random'
		prev = dao.size

		a = Thread.new { adapter = RandomAdapter.new; adapter.connect_stream; puts 'retrieving...' ;}
		a.run
		a.join 5
		Thread.kill(a)
		post = dao.size
	
		post = post-prev
		post.should > 0

    end
  end
end