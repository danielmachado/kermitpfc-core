require_relative "../random_phrase_generator"
require_relative "./adapter"
require_relative "../../helper/DAO"
require_relative "../../logging"

# @author Daniel Machado Fernandez
# @version 1.0
#
# Self implementation from Adapter class to make it works with a Random Phrase Generator
class RandomAdapter < Adapter

	include Logging

	# Initializes the Random Adapter class with the dao parameters
	def initialize
		
		@dao = DAO.new 'rpg'

	end


	# Connects to a Random Phrase Generator and retrieves phrases
	# 
	# @param stream [Integer] number of the stream
	def connect_stream (stream=1)

		logger.info('Starting Random adapter')
		random = RandomPhraseGenerator.new
		i=0
		while true
			
			persist random.generate

			i = i+1
			if i%10 == 0
				sleep 10
			end
			
		end

	end

	# Save the status in a database to release the execution charge of threat that info in real time
	#
	# @param status [String] the status to persist
	def persist status
		@dao.save_status status
	end

end