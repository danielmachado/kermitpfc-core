#Self implementation from Adapter class to make it works with Twitter Streaming API
require_relative "./adapter"
require 'json'
require 'twitter/json_stream'

class TwitterAdapter < Adapter

	:dao
	
	def initialize

		@dao = DAO.new 'twitter'

	end

	def connect_stream
		EventMachine::run {

			stream = Twitter::JSONStream.connect(
			   	:path    => "/1/statuses/filter.json?track=#{@dao.config["twitter"]["track"]}",
		    	:auth    => "#{@dao.config["twitter"]["login"]}:#{@dao.config["twitter"]["pass"]}",
		    	:ssl     => true,
		    	:port    => @dao.config["twitter"]["port"]
		  	)

		  	stream.each_item do |status|

		  		@dao.save_status status
				puts "retrieving..."
		  		
		  	end
		  
			stream.on_error do |message|
			    puts "error: #{message}\n"
			end
			  
			stream.on_reconnect do |timeout, retries|
			    puts "reconnecting in: #{timeout} seconds\n"
			end
			  
			stream.on_max_reconnects do |timeout, retries|
			    puts "Failed after #{retries} failed reconnects\n"
			end
		  
		  	trap('TERM') {
		    	stream.stop
		  	}
		}
	end

end