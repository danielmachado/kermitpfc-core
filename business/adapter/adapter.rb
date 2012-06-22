require 'logger'
#You must implement this class to adapt your stream in our framework
class Adapter

	#Initialices the Class, to test it, it is necessary indicate it
	def initialize (test="default")
		if(test=='default')
			@logger = Logger.new('./log/log.txt','monthly')
		else
			@logger = Logger.new('../log/log.txt','monthly')
		end
		@logger.fatal('The method initialize in Adapter must be implemented')
		raise 'This method must be implemented'
	end
	#Connects to a particular stream
	def connect_stream
		@logger.fatal('The method connect_stream in Adapter must be implemented')
		raise 'This method must be implemented'
	end

	def persist status
		@logger.fatal('The method persist in Adapter must be implemented')
		raise 'This method must be implemented'
	end

end