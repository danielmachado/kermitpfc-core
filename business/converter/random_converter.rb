require 'logger'

require_relative './converter'
require_relative '../../model/USMF/USMF'
require_relative '../../model/USMF/link'
require_relative '../../model/USMF/to_user'
require_relative '../../model/USMF/user'

class RandomConverter < Converter

      def initialize(test='default')
            @test = test
            if(@test=='default')
                  @logger = Logger.new('./log/log.txt','monthly')
            else
                  @logger = Logger.new('../log/log.txt','monthly')
            end
      end

	#Parses a status into a USMF
	def to_usmf status
            @logger.debug("Start the random parse")
		usmf = USMF.new @test
		user = User.new

		x = status.split('@')

		usmf.service = 'Random' 
      	usmf.id = x[0]
      	usmf.text = x[2]
      	user.name = x[1]

      	usmf.user = user

      	usmf.links = []
      	usmf.to_users = []
            @logger.debug("Finish the random parse")
		usmf
		
	end

end