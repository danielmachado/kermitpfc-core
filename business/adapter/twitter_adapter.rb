#Self implementation from Adapter class to make it works with Twitter Streaming API
require 'logger'
require 'json'
require 'twitter/json_stream'

require_relative "./adapter"
require_relative "../../helper/DAO"

class TwitterAdapter < Adapter
	
	def initialize (test='default')
		if(test=='default')
			@logger = Logger.new('./log/log.txt','monthly')
		else
			@logger = Logger.new('../log/log.txt','monthly')
		end
		@logger.info('Starting TwitterAdapter...')
		@dao = DAO.new 'twitter', test
		@logger.info('Database started in ' + test + ' mode')

	end

	def connect_stream
		@logger.debug('retrieving...')
		EventMachine::run {

			stream = Twitter::JSONStream.connect(
			   	:path    => "/1/statuses/filter.json?track=#{@dao.config["twitter"]["track"]}",
		    	:auth    => "#{@dao.config["twitter"]["login"]}:#{@dao.config["twitter"]["pass"]}",
		    	:ssl     => true,
		    	:port    => @dao.config["twitter"]["port"]
		  	)

		  	stream.each_item do |status|

		  		persist status
		  		puts status
				
		  	end
		  
			stream.on_error do |message|
			    @logger.error("#{message}")
			end
			  
			stream.on_reconnect do |timeout, retries|
			    @logger.warn("reconnecting in: #{timeout} seconds\n")
			end
			  
			stream.on_max_reconnects do |timeout, retries|
			    @logger.fatal("Failed after #{retries} failed reconnects\n")
			end
		  
		  	trap('TERM') {
		    	stream.stop
		  	}
		}
	end

	def persist status
		@dao.save_status status
	end

end