class Entity
	
	attr_accessor :hashtags, :urls, :media, :user_mentions

	def to_s
		res = "\n\t HASHTAGS: " + hashtags.to_s + "\n\t URLS: " + urls.to_s + "\n\t MEDIA: " + media.to_s
		res+= "\n\t USER MENTIONS: " + user_mentions.to_s    
		res
	end	
	
end