require_relative './converter'
require_relative '../../model/USMF/USMF'
require_relative '../../model/USMF/link'
require_relative '../../model/USMF/to_user'
require_relative '../../model/USMF/user'
require_relative '../../logging'

# @author Daniel Machado Fernandez
# @version 1.0
#
# Self implementation from the Converter to work it with the Random Phrase Generator
class RandomConverter < Converter

      include Logging

	# Field to field parsing from status to a USMF message
	#
      # @param status [String] the phrase from the Random Phrase Generator
      # @return [USMF] the resultant message
      def to_usmf status

		usmf = USMF.new
		user = User.new

		x = status.split('@')

		usmf.service = 'Random' 
      	usmf.id = x[0]
      	usmf.text = x[2]
      	user.name = x[1]

      	usmf.user = user

      	usmf.links = []
      	usmf.to_users = []
            
		usmf
		
	end

end