class Message

	attr_accessor :geo, :text, :possibly_sensitive_editable, :user, :id, :created_at,
	:in_reply_to_user_id, :in_reply_to_screen_name,	:in_reply_to_status_id, :in_reply_to_status_id_str,
	:favorited, :truncated,	:contributors, :coordinates, :place, :source, :annotations, 
	:entities, :id_str, :retweet_count, :retweeted, :in_reply_to_user_id_str, :possibly_sensitive

	#Coordinates type is the same than Geo

end