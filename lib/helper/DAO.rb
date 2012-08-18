require 'redis'
require_relative '../logging'

# @author Daniel Machado Fernandez
# @version 1.0
#
# Data Access Object to manage the persistence layer of the app
class DAO

	include Logging

	# @!attribute type
	# @return [String] Type of the stream to identify the database
	attr_accessor :type
	
	# @!attribute db
	# @return [Redis] An instance from a Redis DB with the redis gem
	# @see http://rubydoc.info/gems/redis/3.0.1/frames
	attr_accessor :db

	# Config the DAO defining the Data Stream
	#
	# @param type [String] type of the Data Stream to choose the correct database
	def initialize (type = 'twitter')

		@type = type

		logger.debug('Starting DAO...')
		
		logger.info(type + " DAO in " + type.to_s + " type")

		logger.info("config loaded OK")
		connect_database

	end

	# Connects to a redis database
	def connect_database
		@db = Redis.new

		logger.debug("New instance for Redis")

		@db = Redis.connect(
			:db   => "#{Settings.redis.db}",
			:host => "#{Settings.redis.host}",
			:port => Settings.redis.port,
			:password => Settings.redis.password
		)
		
		logger.info("Redis connect OK")
	end

	# Retrieves the next status that were saved in the database
	#
	# @return [String] the status from the Adapter
	def get_status 
		logger.debug("getting status")
		status = @db.rpop @type
		status
	end

	# Deletes the keys in the  database to starts the FW empty
	# @note if the user develops more Streams, add the new keys like the existing ones
	def clean
		logger.debug("cleaning the db")
		@db.del 'twitter'
		@db.del 'rpg'
	end

	# Persists the status into the database
	#
	# @param status [String] the status to persist it
	def save_status status
		@db.rpush @type, status
		logger.info("Status saved")
	end

	# Returns the size of the database
	#
	# @return [Integer] the size (items) of the database
	def size
		logger.debug("getting size")
		@db.llen @type
	end

	# Publish a message in the websocket server
	#
	# @param usmf [USMF] a message to publish 
	def publish usmf
		logger.info("Publishing")
		@db.publish 'ws', usmf
	end

end