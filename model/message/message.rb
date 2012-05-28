require_relative "./Geo"
require_relative "./Entity"
require_relative "./Media"
require_relative "./Place"
require_relative "./User"

class Message

	attr_accessor :text, :user, :created_at, :in_reply_to_status_id_str, :favorited, :coordinates,
	:place, :source, :entities, :id_str, :retweet_count, :retweeted

	#Coordinates type is the same than Geo

	def to_s
		res = "\nid_str: " + id_str.to_s + "\ncreated_at :" + created_at.to_s + "\ntext: " + text.to_s + "\n in_reply_to_status_id_str: " + in_reply_to_status_id_str.to_s + "\n favorited: " + favorited.to_s + "\n source: " + source.to_s + "\n retweet_count: " + retweet_count.to_s + "\n retweeted: " + retweeted.to_s + "\n USER: " + user.to_s + "\n COORDINATES: " + coordinates.to_s + "\n PLACE: " + place.to_s + "\n ENTITIES: " + entities.to_s 
		res
	end


end