class User
	attr_accessor :screen_name, :name, :description, :url, :location, :favourites_count, :statuses_count,
	:friends_count, :time_zone, :utc_offset, :lang, :followers_count, :id_str, :profile_image_url_https

	def to_s
		res = "\n\t screen_name: " + screen_name.to_s + "\n\t name: " + name.to_s + "\n\t description: " + description.to_s + "\n\t url: " + url.to_s + "\n\t location: " + location.to_s + "\n\t favourites_count: " + favourites_count.to_s + "\n\t statuses_count: " + statuses_count.to_s 
		res+= "\n\t friends_count: " + friends_count.to_s + "\n\t time_zone: " + time_zone.to_s + "\n\t utc_offset: " + utc_offset.to_s
		res+= "\n\t lang: " + lang.to_s  + "\n\t followers_count: " + followers_count.to_s + "\n\t id_str: " + id_str.to_s + "\n\t profile_image_url_https: " + profile_image_url_https.to_s

		res
	end

end