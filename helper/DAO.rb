require 'redis'
require 'yaml'

class DAO

	attr_accessor :config,:type, :db

	def initialize (type, mode='default')

		@type = type
		
		if mode == 'test'
			@config = YAML::load( File.open( '../config.yml' ) )
		else
			@config = YAML::load( File.open( 'config.yml' ) )
		end

		puts 'config loaded OK'
		connect_database

	end

	#Connects to a redis database
	def connect_database
		@db = Redis.new
		puts 'New instance for Redis'
		@db = Redis.connect(
			:db   => "#{@config["redis"]["db"]}",
			:host => "#{@config["redis"]["host"]}",
			:port => @config["redis"]["port"]
		)
		puts "Redis connect OK"
	end

	#Retrieves all statuses that were saved in Redis
	def get_status 

		status = @db.rpop @config["redis"][type]
		status
	end

	def save_status status
		@db.rpush @config["redis"][type], status
		puts "Status saved"
	end

	def size
		@db.llen @config["redis"][type]
	end

	def publish usmf

		@db.publish 'ws', usmf

	end

end