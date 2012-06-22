#Self implementation from Adapter class to make it works with a Random Phrase Generator
require 'logger'

require_relative "../random_phrase_generator"
require_relative "./adapter"
require_relative "../../helper/DAO"

class RandomAdapter < Adapter

	def initialize (test='default')
		if(test=='default')
			@logger = Logger.new('./log/log.txt','monthly')
		else
			@logger = Logger.new('../log/log.txt','monthly')
		end
		@dao = DAO.new 'random', test
		@logger.debug('Starting RandomAdapter...')

	end

	def connect_stream

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

	def persist status
		@dao.save_status status
	end

end