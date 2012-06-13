#Self implementation from Adapter class to make it works with a Random Phrase Generator

require_relative "../random_phrase_generator"
require_relative "./adapter"
require_relative "../../helper/DAO"

class RandomAdapter < Adapter

	:dao

	def initialize (test='default')

		@dao = DAO.new 'random', test

	end

	def connect_stream

		random = RandomPhraseGenerator.new
		i=0
		while true
			
			@dao.save_status random.generate
			puts "retrieving..."
			i = i+1
			if i%10 == 0
				sleep 10
			end
			
		end

	end

end