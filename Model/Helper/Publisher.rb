require 'rubygems'
require 'redis'
require 'json'

class Publisher

	def intialize

		@redis = Redis.new

	end

	def publish atom

		@redis.publish 'ws', atom

	end

end