require_relative '../../logging'

# @author Daniel Machado Fernandez
# @version 1.0
# @abstract
#
# Abstract class that must be implemented to transform a specifical status from a Stream into a USMF standard message 
class Converter

	include Logging

	# Parses a status into a USMF message
	# 
	# @raise [Exception] if the method hasn't been implemented yet
	# @param status [String] status retrieved and saved previously in the Adapter
	# @return [USMF] the resultant USMF message
	def to_usmf status

		logger.fatal('The method to_usmf in Converter must be implemented')
		raise 'This method must be implemented'

	end

end