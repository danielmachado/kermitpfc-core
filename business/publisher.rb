require 'rubygems'
require 'redis'
require 'json'

class Publisher

	def intialize

		@redis = Redis.new

	end

	def publish usmf

		@redis.publish 'ws', usmf

	end

end