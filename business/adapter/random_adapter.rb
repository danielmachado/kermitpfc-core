require 'logger'

require_relative "../random_phrase_generator"
require_relative "./adapter"
require_relative "../../helper/DAO"

# @author Daniel Machado Fernandez
#
# Self implementation from {#Adapter} class to make it works with a Random Phrase Generator
class RandomAdapter < Adapter

	# Initializes the RandomAdapter class with the dao parameters
	# 
	# @param [Boolean] true if you are using rspec
	def initialize (test=false)
		if(test==false)
			@logger = Logger.new('./log/log.txt','monthly')
		else
			@logger = Logger.new('../log/log.txt','monthly')
		end
		@dao = DAO.new 'random', test
		@logger.debug('Starting RandomAdapter...')

	end


	# Connects to a RandomPhraseGenerator and retrieves phrases
	# 
	# @param [Integer] number of the stream
	def connect_stream (stream=1)

		random = RandomPhraseGenerator.new
		i=0
		while true
			
			persist random.generate
			@logger.debug('retrieving...')
			i = i+1
			if i%10 == 0
				sleep 10
			end
			
		end

	end

	# Save the status in a database to release the execution charge of threat that info in real time
	#
	# @param [String]
	def persist status
		@dao.save_status status
	end

end