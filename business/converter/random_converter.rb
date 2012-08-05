require 'logger'

require_relative './converter'
require_relative '../../model/USMF/USMF'
require_relative '../../model/USMF/link'
require_relative '../../model/USMF/to_user'
require_relative '../../model/USMF/user'

# @author Daniel Machado Fernandez
# @version 1.0
#
# Self implementation from the Converter to work it with the Random Phrase Generator
class RandomConverter < Converter

      # Initialices the params for the logger
      #
      # @param test [Boolean] true if you are using rspec (path controversia)
      def initialize(test=false)
            @test = test
            if(@test==false)
                  @logger = Logger.new('./log/log.txt','monthly')
            else
                  @logger = Logger.new('../log/log.txt','monthly')
            end
      end

	# Field to field parsing from status to a USMF
	#
      # @param status [String] the phrase from the Random Phrase Generator
      # @return usmf [USMF] the resultant message
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