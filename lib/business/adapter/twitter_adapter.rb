require 'json'
require 'twitter/json_stream'

require_relative "./adapter"
require_relative "../../helper/DAO"
require_relative "../../logging"

# @author Daniel Machado Fernandez
# @version 1.0
#
# Self implementation from Adapter class to make it works with Twitter Streaming API
class TwitterAdapter < Adapter
	
	include Logging

	# Configures the dao with the apropiates params
	def initialize

		logger.info('Starting TwitterAdapter...')
		@dao = DAO.new 'twitter'

	end

	# Connects to the Twitter Streaming API and retrieves statuses with a track word previously defined
	# 
	# @param stream [Integer] the number of the stream to identify it (use it when you have got more than one)
	def connect_stream (stream=1)
		
		logger.debug('retrieving...')
		puts 'retrieving... '
		EventMachine::run {

			stream = Twitter::JSONStream.connect(
			   	:path    => "/1/statuses/filter.json?track=#{Logging::config["twitter"]["track"]["track#{stream}"]}",
		    	:auth    => "#{Logging::config["twitter"]["login"]}:#{Logging::config["twitter"]["pass"]}",
		    	:ssl     => true,
		    	:port    => Logging::config["twitter"]["port"]
		  	)

		  	stream.each_item do |status|

		  		persist status
				
		  	end
		  
			stream.on_error do |message|
			    logger.error("#{message}")
			end
			  
			stream.on_reconnect do |timeout, retries|
			    logger.warn("reconnecting in: #{timeout} seconds\n")
			end
			  
			stream.on_max_reconnects do |timeout, retries|
			    logger.fatal("Failed after #{retries} failed reconnects\n")
			end
		  
		  	trap('TERM') {
		    	stream.stop
		  	}
		}
	end

	# Saves the tweet into the database
	#
	# @param status [String] tweet retrieved previously
	def persist status
		
		@dao.save_status status
	
	end

end