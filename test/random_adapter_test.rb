require_relative '../model/helper/random_adapter'
class RandomAdapterTest

	def initialize

		@tester = RandomAdapter.new
		puts 'Test is comming'
		@db = @tester.connect_database
		
	end

	#Testing if phrases has been saved in the database
	def test_it!
 
		puts @db.lrange 'random', 0, -1
	
	end

end