require 'logger'
# @author Daniel Machado Fernandez
#
# You must implement this class to adapt your data stream in our framework
class Adapter

	# Initializes the Adapter, to test it, it is necessary to indicate it
	#
	# @param [Boolean] if the method is used with a param, it must be true to test 
	def initialize (test=false)
		if(test==false)
			@logger = Logger.new('./log/log.txt','monthly')
		else
			@logger = Logger.new('../log/log.txt','monthly')
		end
	
		@logger.fatal('The method initialize in Adapter must be implemented')
		raise 'This method must be implemented'
	
	end

	# Connects to a particular data stream
	#
	# @param [Integer] the number of the stream to identify it
	def connect_stream (stream=1)
		@logger.fatal('The method connect_stream in Adapter must be implemented')
		raise 'This method must be implemented'
	end

	# Persist the status retrieved from the data stream
	#
	# @param [String] the status retrieved from the data stream
	def persist status
		@logger.fatal('The method persist in Adapter must be implemented')
		raise 'This method must be implemented'
	end

end