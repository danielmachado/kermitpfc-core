require_relative './converter'
require_relative '../../model/USMF/USMF'
require_relative '../../model/USMF/link'
require_relative '../../model/USMF/to_user'
require_relative '../../model/USMF/user'

class RandomConverter < Converter

	#Parses a status into a USMF
	def to_usmf status

		usmf = USMF.new
		user = User.new

		x = status.split('@')

		usmf.service = 'Random' 
      	usmf.id = x[0]
      	usmf.geo = nil
      	usmf.application = nil
      	usmf.location = nil
      	usmf.date = nil
      	usmf.source = nil
      	usmf.text = x[2]
      	usmf.description = nil
      	usmf.keywords = nil
      	usmf.category = nil
      	usmf.duration = nil
      	usmf.likes = nil
      	usmf.dislikes = nil
      	usmf.favorites = nil
      	usmf.comments = nil
      	usmf.rates = nil
      	usmf.rating = nil
      	usmf.min_rating = nil
      	usmf.max_rating = nil

      	user.name = x[1]
      	user.real_name = nil
      	user.id = nil
      	user.language = nil
      	user.utc = nil
      	user.geo = nil
      	user.description = nil
      	user.avatar = nil
      	user.location = nil
      	user.subscribers = nil
      	user.subscriptions = nil
      	user.postings = nil
      	user.profile = nil
      	user.website = nil

      	usmf.user = user

      	usmf.links = []
      	usmf.to_users = []


		usmf
		
	end

end