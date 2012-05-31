#Self implementation from Adapter class to make it works with a Random Phrase Generator

require_relative "../random_phrase_generator"
require_relative "./adapter"

class RandomAdapter < Adapter

	:dao

	def initialize

		@dao = DAO.new 'random'

	end

	def connect_stream

		random = RandomPhraseGenerator.new

		while true
			@dao.save_status random.generate
			puts "retrieving..."
		end
	end

end