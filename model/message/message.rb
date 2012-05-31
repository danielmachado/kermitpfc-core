require_relative "./geo"
require_relative "./entity"
require_relative "./media"
require_relative "./place"
require_relative "./user"

class Message

	attr_accessor :text, :user, :created_at, :in_reply_to_user_id_str, :in_reply_to_status_id_str, :favorited, :coordinates,
	:place, :source, :entities, :id_str, :retweet_count, :retweeted

	#Coordinates type is the same than Geo

	def to_s
		res = "\nid_str: " + id_str.to_s + "\ncreated_at :" + created_at.to_s + "\ntext: " + text.to_s + "\nin_reply_to_user_id_str: " + in_reply_to_user_id_str.to_s + "\nfavorited: " + favorited.to_s + "\n source: " + source.to_s + "\n retweet_count: " + retweet_count.to_s + "\n retweeted: " + retweeted.to_s + "\nin_reply_to_status_id_str: " + in_reply_to_status_id_str.to_s + "\n USER: " + user.to_s + "\n COORDINATES: " + coordinates.to_s + "\n PLACE: " + place.to_s + "\n ENTITIES: " + entities.to_s 
		res
	end


end