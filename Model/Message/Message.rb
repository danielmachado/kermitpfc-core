require_relative "./Geo"
require_relative "./Entity"
require_relative "./Media"
require_relative "./Place"
require_relative "./User"
require_relative "./Contributor"

class Message

	attr_accessor :geo, :text, :possibly_sensitive_editable, :user, :created_at,
	:in_reply_to_screen_name, :in_reply_to_status_id_str, :favorited, :truncated,
	:contributors, :coordinates, :place, :source, :annotations, 
	:entities, :id_str, :retweet_count, :retweeted, :in_reply_to_user_id_str, :possibly_sensitive

	#Coordinates type is the same than Geo

	def to_s
		res = "\nid_str: " + id_str.to_s + "\ncreated_at :" + created_at.to_s + "\ntext: " + text.to_s + "\n possibly_sensitive_editable: " + possibly_sensitive_editable.to_s + "\n possibly_sensitive: " + possibly_sensitive.to_s  + "\n in_reply_to_user_id_str: " + in_reply_to_user_id_str.to_s + "\n in_reply_to_screen_name: " + in_reply_to_screen_name.to_s + "\n in_reply_to_status_id_str: " + in_reply_to_status_id_str.to_s + "\n favorited: " + favorited.to_s + "\n truncated: " + truncated.to_s + "\n source: " + source.to_s + "\n annotations: " + annotations.to_s + "\n retweet_count: " + retweet_count.to_s + "\n retweeted: " + retweeted.to_s + "\n GEO: " + geo.to_s + "\n USER: " + user.to_s + "\n CONTRIBUTORS: " + contributors.to_s + "\n COORDINATES: " + coordinates.to_s + "\n PLACE: " + place.to_s + "\n ENTITIES: " + entities.to_s 
		res
	end


end