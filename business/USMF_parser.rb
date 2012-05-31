require_relative '../model/USMF/USMF'
require_relative '../model/USMF/link'
require_relative '../model/USMF/to_user'
require_relative '../model/USMF/user'

class USMFParser

	def to_usmf (message, service)

		usmf = USMF.new

		usmf.service = service
		usmf.id = message.id_str
		usmf.geo = nil
		usmf.application = message.source
		unless message.place == nil
			usmf.location = message.place.full_name + ", " + message.place.country
		end
		usmf.date = message.created_at
		usmf.source = "https://www.twitter.com/" + message.id_str #caution, not only for twitter
		usmf.text = message.text
		usmf.description = message.in_reply_to_user_id_str
		
		unless message.entities.hashtags == nil

			message.entities.hashtags.each do |h| 

				usmf.keywords += h.text + ", "

			end

		end

		usmf.likes = message.retweet_count
		usmf.dislikes = nil
		
		user = User.new
		user.name = message.user.screen_name
		user.real_name = message.user.name
		user.id = message.user.id_str
		user.language = message.user.lang
		user.utc = message.user.time_zone.to_s + " + " + message.user.utc_offset.to_s
		user.geo = message.place
		user.description = message.user.description
		user.avatar = message.user.profile_image_url_https
		user.location = message.user.location
		user.subscribers = message.user.followers_count
		user.subscriptions = message.user.friends_count
		user.postings = message.user.statuses_count
		user.profile = "https://www.twitter.com/" + message.user.id_str #caution, not only for Twitter
		user.website = message.user.url

		usmf.user = user

		usmf.to_users = []

		unless message.entities.user_mentions == nil
		
			message.entities.user_mentions.each do |user_mention|

				tu = ToUser.new

				tu.name = user_mention.screen_name
				tu.id = user_mention.id_str
				if user_mention.id_str == message.in_reply_to_user_id_str
					tu.service = "reply"
				else
					tu.service = "mention"
				end
				unless message.in_reply_to_status_id_str == nil
					tu.title = message.in_reply_to_status_id_str
					tu.href = "https://www.twitter.com/" + message.in_reply_to_status_id_str #caution, not only twitter
				end
				
				usmf.to_users << tu

			end
		end

		usmf.links = []

		unless message.entities.urls == nil

			message.entities.urls.each do |url|

				l = Link.new
				l.title = nil
				l.service = nil
				l.thumbnail = nil
				l.href = url.url

				usmf.links << l

			end

		end

		unless message.entities.media == nil

			message.entities.urls.each do |url|

				l = Link.new
				l.title = url.type
				l.service = nil
				l.thumbnail = url.media_url
				l.href = url.url

				usmf.links << l

			end
			
		end

		usmf

	end


end