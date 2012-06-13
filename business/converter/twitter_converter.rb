require_relative './converter'
require_relative '../../model/USMF/USMF'
require_relative '../../model/USMF/link'
require_relative '../../model/USMF/to_user'
require_relative '../../model/USMF/user'

require 'json'

class TwitterConverter < Converter

	def to_usmf status

		usmf = USMF.new
		user = User.new

		status = JSON.parse(status)
		if status.has_key? 'Error'
			raise "status malformed"
		end

		#Retrieving a status from Twitter
		usmf.service = "Twitter"
		usmf.id = status["id_str"]
		

		x = status["coordinates"]
		unless x==nil
			usmf.geo = x["coordinates"]
		end
		
		usmf.application = status["source"]
		

		x = status["place"]
		unless x == nil
			usmf.location = x["full_name"] + " , " + x["country"]
		end

		usmf.date = status["created_at"]
		usmf.text = status["text"]
		usmf.description = status["in_reply_to_status_id_str"]
		usmf.likes = status["retweet_count"]
		usmf.dislikes = nil

		#Retrieving user
		x = status["user"]
		unless x == nil
			user.name = x["screen_name"]
			user.real_name = x["name"]
			user.id = x["id_str"]
			user.language = x["lang"]
			unless x["time_zone"] == nil and x["utc_offset"] == nil
				user.utc = x["time_zone"].to_s + " + " + x["utc_offset"].to_s
			end
			user.geo = nil
			user.description = x["description"]
			user.avatar = x["profile_image_url_https"]
			user.location = x["location"]
			user.subscribers = x["followers_count"]
			user.subscriptions = x["friends_count"]
			user.postings = x["statuses_count"]
			user.profile = "https://twitter.com/#!/#{user.name}"
			user.website = x["url"]
			usmf.favorites = x["favourites_count"] #wrong

			usmf.user = user
			usmf.source = "https://twitter.com/#{usmf.user.name}/status/#{usmf.id}"
		end
		

		usmf.to_users = []
		usmf.links = []

		#Retrieving entities

		entities = status["entities"]
		unless entities == nil
		
		#Retrieving URLs

			x = entities["urls"]
			unless x == nil
				x.each do |item|
					l = Link.new
					l.title = nil
					l.service = nil
					l.thumbnail = nil
					l.href = item["url"]
					
					usmf.links << l
				end
			end

		#Retrieving all media content

			x = entities["media"]
			unless x == nil
				x.each do |item|
					l = Link.new
					l.title = item["type"]
					l.service = nil
					l.thumbnail = item["media_url"]
					l.href = item["url"]
					
					usmf.links << l
				end
			end

			#Retrieving hashtags

			x = entities["hashtags"]
			unless x == nil

				usmf.keywords = ""
				x.each do |h| 

					usmf.keywords += h["text"] + ", "

				end

			end

			#Retrieving mentions

			x = entities["user_mentions"]
			unless x == nil
				x.each do |item|
					tu = ToUser.new

					tu.name = item["screen_name"]
					tu.id = item["id_str"]

					if item["id_str"] == status["in_reply_to_user_id_str"]
						tu.service = "reply"
					else
						tu.service = "mention"
					end
					unless status["in_reply_to_status_id_str"] == nil
						tu.title = status["in_reply_to_status_id_str"]
						tu.href = "https://twitter.com/#{usmf.user.name}/status/#{usmf.id}"
					end

					usmf.to_users << tu
				end
			end

		end

		usmf

	end

end