#You must implement this class to adapt your stream in our framework
class Adapter
	#Method which connects to a particular stream
	def connect_stream

	end

	#Method wich connects to a redis database and returns a db connection (if you would like to test it)
	def connect_database

	end

	#Method which connects from a data stream to a redis database
	def to_redis status
	
	end

end