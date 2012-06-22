#Abstract class that must be implemented to transform a specifical status from a Stream into a our generic Message
require 'logger'
class Converter

	def initialize(test='default')
		if(test=='default')
			@logger = Logger.new('./log/log.txt','monthly')
		else
			@logger = Logger.new('../log/log.txt','monthly')
		end
	end

	#Parses a status into a USMF
	def to_usmf status
		@logger = Logger.new('./log/log.txt','monthly')
		@logger.fatal('The method to_usmf in Converter must be implemented')
		raise 'This method must be implemented'
	end

end