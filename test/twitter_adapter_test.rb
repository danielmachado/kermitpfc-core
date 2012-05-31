require_relative '../model/helper/twitter_adapter'
class TwitterAdapterTest

	def initialize

		@tester = TwitterAdapter.new
		puts 'Test is comming'
		@db = @tester.connect_database
		
	end

	#Testing if tweets has been saved in the database
	def test_it!
 
		puts @db.lrange 'tweets', 0, -1
	
	end

end