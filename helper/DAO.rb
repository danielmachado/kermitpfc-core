require 'redis'
require 'yaml'
require 'logger'

class DAO

	attr_accessor :config,:type, :db

	def initialize (type, mode='default')

		@type = type

		if mode == 'test'
			@logger = Logger.new('../log/log.txt','monthly')
			@logger.debug('Starting DAO...')
			@config = YAML::load( File.open( '../config.yml' ) )
		else
			@logger = Logger.new('./log/log.txt','monthly')
			@logger.debug('Starting DAO...')
			@config = YAML::load( File.open( 'config.yml' ) )
		end
		
		@logger.info(type + " DAO in " + mode + " mode")

		@logger.info("config loaded OK")
		connect_database

	end

	#Connects to a redis database
	def connect_database
		@db = Redis.new
		
		@logger.debug("New instance for Redis")
		
		@db = Redis.connect(
			:db   => "#{@config["redis"]["db"]}",
			:host => "#{@config["redis"]["host"]}",
			:port => @config["redis"]["port"]
		)
		
		@logger.info("Redis connect OK")
	end

	#Retrieves all statuses that were saved in Redis
	def get_status 
		@logger.debug("getting status")
		status = @db.rpop @config["redis"][type]
		status
	end

	def save_status status
		@db.rpush @config["redis"][type], status
		@logger.info("Status saved")
	end

	def size
		@logger.debug("getting size")
		@db.llen @config["redis"][type]
	end

	def publish usmf
		@logger.info("Publishing")
		@db.publish 'ws', usmf

	end

end