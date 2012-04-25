#Self implementation from Adapter class to make it works with a Random Phrase Generator
require 'rubygems'
require_relative "../RandomPhraseGenerator"
require_relative "./Adapter"
require 'redis'
require 'yaml'

class RandomAdapter < Adapter

	def initialize

		@config = YAML::load( File.open( '../../config.yml' ) )
		puts 'config loaded OK'

	end	

	def connect_database

		@db = Redis.new
		puts 'New instance for Redis'
		@db = Redis.connect(
			:db   => "Random",
			:host => "#{@config["redis"]["host"]}",
			:port => @config["redis"]["port"]
		)
		puts "Redis connect OK"
		@db
	end

	def connect_stream

		random = RandomPhraseGenerator.new

		while true
			to_redis(random.generate)
			puts "retrieving..."
		end
	end

	def to_redis status

		@db.rpush 'random', status
		puts "Random phrase saved"

	end

end