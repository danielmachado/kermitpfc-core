require 'logger'
require 'json'

require_relative './converter'
require_relative '../../model/USMF/USMF'
require_relative '../../model/USMF/link'
require_relative '../../model/USMF/to_user'
require_relative '../../model/USMF/user'

# @author Daniel Machado Fernandez
# @version 1.0
#
# Twitter Specification from Converter
class TwitterConverter < Converter

	# Initialices the logger
	#
	# @param test [Boolean] true if you are using rspec (path controversia)
	def initialize(test=false)
            @test = test
            if(@test==false)
                  @logger = Logger.new('./log/log.txt','monthly')
            else
                  @logger = Logger.new('../log/log.txt','monthly')
            end
            @logger.debug("Starting RandomAdapter...")
    end

    # Field to field parsing to become a tweet into a USMF message
    #
    # @param status [String] the tweet previously retrieved
    # @return usmf [USMF] the resultant message
	def to_usmf status

		@logger.debug("Starting tweet parse")

		usmf = USMF.new @test 
		user = User.new

		status = JSON.parse(status)
		if status.has_key? 'Error'
			@logger.error("tweet malformed")
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

			user.description = x["description"]
			user.avatar = x["profile_image_url_https"]
			user.location = x["location"]
			user.subscribers = x["followers_count"]
			user.subscriptions = x["friends_count"]
			user.postings = x["statuses_count"]
			user.profile = "https://twitter.com/#!/#{user.name}"
			user.website = x["url"]

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
						tu.href = "https://twitter.com/#{tu.name}/status/#{tu.title}"
					end

					usmf.to_users << tu
				end
			end

		end

		@logger.debug("Finished tweet parse")

		usmf

	end

end