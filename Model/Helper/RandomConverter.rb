class RandomConverter < Converter

	#Retrieves all statuses that were saved in Redis
	def from_redis

	end

	#Parses a status into a Message
	def to_message status

		return message;
	end	

end