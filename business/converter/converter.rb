require 'logger'

# @author Daniel Machado Fernandez
# @version 1.0
# @abstract
#
# Abstract class that must be implemented to transform a specifical status from a Stream into a USMF standard message 
class Converter

	# Initializes the Converter class
	# 
	# @raise [Exception] if the method hasn't been implemented yet
	# @param test [Boolean] true if you are using rspec (path controversia)
	def initialize(test=false)
		if(test==false)
			@logger = Logger.new('./log/log.txt','monthly')
		else
			@logger = Logger.new('../log/log.txt','monthly')
		end
		@logger.fatal('The method initialize in Converter must be implemented')
		raise 'This method must be implemented'
	end

	# Parses a status into a USMF message
	# 
	# @raise [Exception] if the method hasn't been implemented yet
	# @param status [String] status retrieved and saved previously in the Adapter
	# @return [USMF] the resultant USMF message
	def to_usmf status
		@logger = Logger.new('./log/log.txt','monthly')
		@logger.fatal('The method to_usmf in Converter must be implemented')
		raise 'This method must be implemented'
		nil
	end

end