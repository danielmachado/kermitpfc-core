require_relative './converter'
require_relative '../../model/message/message'
require_relative '../../model/message/entity'
require_relative '../../model/message/geo'
require_relative '../../model/message/hashtag'
require_relative '../../model/message/media'
require_relative '../../model/message/place'
require_relative '../../model/message/URL'
require_relative '../../model/message/user'
require_relative '../../model/message/user_mention'

require 'json'

class TwitterConverter < Converter

	#Parses a status into a Message
	def to_message status

		message = Message.new
		
		user = User.new

		status = JSON.parse(status)
		if status.has_key? 'Error'
      		raise "status malformed"
   		end

		message.text = status["text"]
		message.retweet_count = status["retweet_count"]
		message.in_reply_to_user_id_str = status["in_reply_to_user_id_str"]
		message.created_at = status["created_at"]
		message.id_str = status["id_str"]
		message.favorited = status["favorited"]
		message.source = status["source"]
		message.retweeted = status["retweeted"]

		x = status["coordinates"]
		unless x==nil
			geo = Geo.new
			geo.type = x["type"]
			geo.coordinates = x["coordinates"]
			message.coordinates = geo
		end

		x = status["place"]
		unless x == nil
			place = Place.new
			place.place_type = x["place_type"]
			place.country = x["country"]
			place.url = x["url"]
			place.country_code = x["country_code"]
			place.full_name = x["full_name"]
			place.name = x["name"]
			place.id = x["id"]
			place.attributes = x["attributes"]
			b = Geo.new
			x = x["bounding_box"]
			b.type = x["type"]
			b.coordinates = x["coordinates"]
			place.bounding_box = b
			message.place = place
		end

		x = status["user"]
		user.time_zone = x["time_zone"]
		user.url = x["url"]
		user.description = x["description"]
		user.profile_image_url_https = x["profile_image_url_https"]
		user.followers_count = x["followers_count"]
		user.location = x["location"]
		user.lang = x["lang"]
		user.screen_name = x["screen_name"]
		user.friends_count = x["friends_count"]
		user.name = x["name"]
		user.statuses_count = x["statuses_count"]
		user.favourites_count = x["favourites_count"]
		user.id_str = x["id_str"]
		user.utc_offset = x["utc_offset"]
		message.user = user

		entities = status["entities"]
		unless entities == nil
			entity = Entity.new
			x = entities["urls"]
			unless x == nil
				entity.urls = []
				x.each do |item|
					url = URL.new
					url.url = item["url"]
					
					entity.urls << url
				end
			end
			x = entities["hashtags"]
			unless x == nil
				entity.hashtags = []
				x.each do |item|
					ht = Hashtag.new
					ht.text = item["text"]

					entity.hashtags << ht
				end
			end
			x = entities["user_mentions"]
			unless x == nil
				entity.user_mentions = []
				x.each do |item|
					mentions = UserMention.new
					mentions.screen_name = item["screen_name"]
					mentions.id_str = item["id_str"]

					entity.user_mentions << mentions
				end
			end
			x = entities["media"]
			unless x == nil
				entity.media = []
				x.each do |item|
					media = Media.new
					media.type = item["type"]
					media.url = item["url"]
					media.media_url = item["media_url"]
					
					entity.media << media
				end
			end
			message.entities = entity	
		end

		message
		
	end	

end