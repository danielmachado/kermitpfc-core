#Self implementation from Adapter class to make it works with Twitter Streaming API
require 'rubygems'
require './Adapter'
require 'redis'
require 'json'
require 'twitter/json_stream'
require 'yaml'

class TwitterAdapter < Adapter

	def initialize

		@config = YAML::load( File.open( '../../config.yml' ) )
		puts 'config loaded OK'

	end

	def connect_database

		@db = Redis.new
		puts 'New instance for Redis'
		@db = Redis.connect(
			:db   => "Twitter",
			:host => "#{@config["redis"]["host"]}",
			:port => @config["redis"]["port"]
		)
		puts "Redis connect OK"
		@db
	end

	def connect_stream
		EventMachine::run {

			

			stream = Twitter::JSONStream.connect(
			   	:path    => "/1/statuses/filter.json?track=#{@config["twitter"]["track"]}",
		    	:auth    => "#{@config["twitter"]["login"]}:#{@config["twitter"]["pass"]}",
		    	:ssl     => true,
		    	:port    => @config["twitter"]["port"]
		  	)

		  	stream.each_item do |status|

		  		to_redis(status)
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

	def to_redis status

		@db.rpush 'tweets', status
		puts "Tweet saved"

	end

end