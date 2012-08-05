require 'logger'

# @author Daniel Machado Fernandez
# @version 1.0
#
# Abstract class that must be implemented to transform a specifical status from a Stream into a USMF standard message 
class Converter

	# Initializes the Converter class
	# 
	# @param test [Boolean] true if you are using rspec (path controversia)
	def initialize(test=false)
		if(test==false)
			@logger = Logger.new('./log/log.txt','monthly')
		else
			@logger = Logger.new('../log/log.txt','monthly')
		end
	end

	# Parses a status into a USMF message
	# 
	# @param status [String] status retrieved and saved previously in the Adapter
	# @return usmf [USMF] the resultant USMF message
	def to_usmf status
		@logger = Logger.new('./log/log.txt','monthly')
		@logger.fatal('The method to_usmf in Converter must be implemented')
		raise 'This method must be implemented'
		nil
	end

end