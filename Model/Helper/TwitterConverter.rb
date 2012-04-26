require_relative './Converter'
require_relative '../Message/Message'
require_relative '../Message/Contributor'
require_relative '../Message/Entity'
require_relative '../Message/Geo'
require_relative '../Message/HashTag'
require_relative '../Message/Media'
require_relative '../Message/Place'
require_relative '../Message/Size'
require_relative '../Message/URL'
require_relative '../Message/User'
require_relative '../Message/UserMention'
require 'redis'
require 'json'
require 'yaml'

class TwitterConverter < Converter

	def initialize

		@config = YAML::load( File.open( 'config.yml' ) )
		puts 'config loaded OK'
		connect_database

	end

	def connect_database

		@db = Redis.new
		puts 'New instance for Redis'
		@db = Redis.connect(
			:db   => "Twitter",
			:host => "#{@config["redis"]["host"]}",
			:port => @config["redis"]["port"]
		)
		puts "Redis connect OK"
	end

	#Retrieves all statuses that were saved in Redis
	def from_redis
		status = @db.rpop 'tweets'
		to_message(status)

	end

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
		message.in_reply_to_user_id = status["in_reply_to_user_id"]
		message.in_reply_to_user_id_str = status["in_reply_to_user_id_str"]
		message.in_reply_to_status_id = status["in_reply_to_status_id"]
		message.in_reply_to_status_id_str = status["in_reply_to_status_id_str"]
		message.in_reply_to_screen_name = status["in_reply_to_screen_name"]
		message.created_at = status["created_at"]
		message.id = status["id"]
		message.id_str = status["id_str"]
		message.favorited = status["favorited"]
		message.source = status["source"]
		message.in_reply_to_screen_name = status["in_reply_to_screen_name"]
		message.truncated = status["truncated"]
		message.retweeted = status["retweeted"]
		message.possibly_sensitive = status["possibly_sensitive"]
		message.possibly_sensitive_editable = status["possibly_sensitive_editable"]

		x = status["contributors"]
		unless x == nil 
			c = Contributor.new
			c.id_str = x["id_str"]
			c.screen_name = x["screen_name"]
			message.contributors = c;
		end

		x = status["coordinates"]
		unless x==nil
			geo = Geo.new
			geo.type = x["type"]
			geo.coordinates = x["coordinates"]
			message.coordinates = geo
		end

		x = status["geo"]
		unless x == nil
			geo = Geo.new
			geo.type = x["type"]
			geo.coordinates = x["coordinates"]
			message.geo = geo
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
		user.profile_background_image_url_https = x["profile_background_image_url_https"]
		user.profile_sidebar_fill_color = x["profile_sidebar_fill_color"]
		user.listed_count = x["listed_count"]
		user.time_zone = x["time_zone"]
		user.created_at = x["created_at"]
		user.profile_sidebar_border_color = x["profile_sidebar_border_color"]
		user.verified = x["verified"]
		user.url = x["url"]
		user.description = x["description"]
		user.default_profile = x["default_profile"]
		user.profile_use_background_image = x["profile_use_background_image"]
		user.is_translator = x["is_translator"]
		user.contributors_enabled = x["contributors_enabled"]
		user.geo_enabled = x["geo_enabled"]
		user.notifications = x["notifications"]
		user.profile_text_color = x["profile_text_color"]
		user.profile_image_url_https = x["profile_image_url_https"]
		user.profile_background_image_url = x["profile_background_image_url"]
		user.followers_count = x["followers_count"]
		user.profile_image_url = x["profile_image_url"]
		user.location = x["location"]
		user.lang = x["lang"]
		user.profile_link_color = x["profile_link_color"]
		user.prot = x["protected"]
		user.screen_name = x["screen_name"]
		user.default_profile_image = x["default_profile_image"]
		user.show_all_inline_media = x["show_all_inline_media"]
		user.friends_count = x["friends_count"]
		user.name = x["name"]
		user.statuses_count = x["statuses_count"]
		user.favourites_count = x["favourites_count"]
		user.profile_background_color = x["profile_background_color"]
		user.id = x["id"]
		user.id_str = x["id_str"]
		user.follow_request_sent = x["follow_request_sent"]
		user.following = x["following"]
		user.profile_background_tile = x["profile_background_tile"]
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
					url.expanded_url = item["expanded_url"]
					url.indices = item["indices"]
					url.url = item["url"]
					url.display_url = item["display_url"]
					entity.urls << url
				end
			end
			x = entities["hashtags"]
			unless x == nil
				entity.hashtags = []
				x.each do |item|
					ht = HashTag.new
					ht.text = item["text"]
					ht.indices = item["indices"]
					entity.hashtags << ht
				end
			end
			x = entities["user_mentions"]
			unless x == nil
				entity.user_mentions = []
				x.each do |item|
					mentions = UserMention.new
					mentions.indices = item["indices"]
					mentions.screen_name = item["screen_name"]
					mentions.name = item["name"]
					mentions.id = item["id"]
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
					media.expanded_url = item["expanded_url"]
					media.indices = item["indices"]
					media.media_url = item["media_url"]
					media.url = item["url"]
					media.media_url_https = item["media_url_https"]
					media.display_url = item["display_url"]
					media.id = item["id"]
					media.id_str = item["id_str"]
					
					item = item["sizes"]
					y = item["large"]
					size = Size.new
					size.height = y["h"]
					size.resize = y["resize"]
					size.weight = y["w"]
					media.large = size

					y = item["medium"]
					size.height = y["h"]
					size.resize = y["resize"]
					size.weight = y["w"]
					media.medium = size

					y = item["small"]
					size.height = y["h"]
					size.resize = y["resize"]
					size.weight = y["w"]
					media.small = size

					y = item["thumb"]
					size.height = y["h"]
					size.resize = y["resize"]
					size.weight = y["w"]
					media.thumb = size
					
					entity.media << media
				end
			end
			message.entities = entity	
		end

		message
		
	end	

end