#Abstract class that must be implemented to transform a specifical status from a Stream into a our generic Message
class Converter
	#Retrieves all statuses that were saved in Redis
	def from_redis

	end

	#Parses a status into a Message
	def to_message status

	end	

end