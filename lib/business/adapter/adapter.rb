require_relative '../../logging'
# @author Daniel Machado Fernandez
# @version 1.0
# @abstract 
# 
# You must implement this class to adapt your data stream in our framework
class Adapter

	include Logging

	# Initializes the Adapter to run the logger
	#
	# @raise [Exception] if the method hasn't been implemented yet
	def initialize
		
		logger.fatal('The method initialize in Adapter must be implemented')
		raise 'This method must be implemented'
	
	end

	# Connects to a particular data stream
	#
	# @raise [Exception] if the method hasn't been implemented yet
	# @param stream [Integer] the number of the stream to identify it
	def connect_stream (stream=1)
		logger.fatal('The method connect_stream in Adapter must be implemented')
		raise 'This method must be implemented'
	end

	# Persist the status retrieved from the data stream
	#
	# @raise [Exception] if the method hasn't been implemented yet
	# @param status [String] the status retrieved from the data stream
	def persist status
		logger.fatal('The method persist in Adapter must be implemented')
		raise 'This method must be implemented'
	end

end