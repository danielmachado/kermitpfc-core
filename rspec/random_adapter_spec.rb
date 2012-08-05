# random_adapter_spec.rb

require_relative '../business/adapter/random_adapter'
require_relative '../helper/DAO'

describe RandomAdapter do
  describe "#connect_stream" do
    it "returns a status that was retrieved from the RandomPhraseGenerator Stream" do

		dao = DAO.new 'random', true
		prev = dao.size

		a = Thread.new { adapter = RandomAdapter.new true; adapter.connect_stream; puts 'retrieving...' ;}
		a.run
		a.join 5
		Thread.kill(a)
		post = dao.size
	
		post = post-prev
		post.should > 0

    end
  end
end