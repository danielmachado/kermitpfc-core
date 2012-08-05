require 'redis'
require 'yaml'
require 'logger'

# @author Daniel Machado Fernandez
# @version 1.0
#
# Data Access Object to manage the persistence layer of the app
class DAO

	attr_accessor :config,:type, :db

	# Config the DAO defining the Stream and the correct params for testing
	#
	# @param type [String] type of the Data Stream to choose the correct database
	# @param mode [Boolean] for test purpouses (path controversia). true if you are using rspec
	def initialize (type, mode=false)

		@type = type

		if mode == false
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

	# Connects to a redis database
	def connect_database
		@db = Redis.new
		
		@logger.debug("New instance for Redis")
		
		@db = Redis.connect(
			:db   => "#{@config["redis"]["db"]}",
			:host => "#{@config["redis"]["host"]}",
			:port => @config["redis"]["port"],
			:password => @config["redis"]["password"]
		)
		
		@logger.info("Redis connect OK")
	end

	# Retrieves the next status that were saved in the database
	#
	# @return status [String] the status from the Adapter
	def get_status 
		@logger.debug("getting status")
		status = @db.rpop @config["redis"][type]
		status
	end

	# Persists the status into the database
	#
	# @param status [String] the status to persist it
	def save_status status
		@db.rpush @config["redis"][type], status
		@logger.info("Status saved")
	end

	# Returns the size of the database
	#
	# @return size [Integer] the size (items) of the database
	def size
		@logger.debug("getting size")
		@db.llen @config["redis"][type]
	end

	# Publish a message in the websocket server
	#
	# @param usmf [USMF] a message to publish 
	def publish usmf
		@logger.info("Publishing")
		@db.publish 'ws', usmf

	end

end