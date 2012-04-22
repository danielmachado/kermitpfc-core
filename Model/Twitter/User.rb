class User
	attr_accessor :id, :screen_name, :name, :description, :url, :location, :profile_background_color, 
	:profile_background_image_url, :profile_background_tile, :profile_image_url, :profile_link_color,
	:profile_sidebar_border_color, :profile_sidebar_fill_color, :profile_text_color, :created_at,
	:contributors_enabled, :favourites_count, :statuses_count, :friends_count, :time_zone, :utc_offset,
	:lang, :prot, :followers_count, :geo_enabled, :notifications, :verified, 
	:id_str, :default_profile, :default_profile_image, :follow_request_sent, :is_translator, :listed_count,
	:profile_background_image_url_https, :profile_image_url_https, :profile_use_background_image,
	:show_all_inline_media, :following

	def to_s
		res = "\n\t screen_name: " + screen_name.to_s + "\n\t name: " + name.to_s + "\n\t description: " + description.to_s + "\n\t url: " + url.to_s + "\n\t location: " + location.to_s + "\n\t profile_background_color: " + profile_background_color.to_s
		res+= "\n\t profile_background_image_url: " + profile_background_image_url.to_s + "\n\t profile_background_tile: " 
		res+= profile_background_tile.to_s + "\n\t profile_image_url: " + profile_image_url.to_s + "\n\t profile_link_color: " 
		res+= profile_link_color.to_s + "\n\t profile_sidebar_border_color: " + profile_sidebar_border_color.to_s 
		res+= "\n\t profile_sidebar_fill_color: " + profile_sidebar_fill_color.to_s + "\n\t profile_text_color: " 
		res+= profile_text_color.to_s + "\n\t created_at: " + created_at.to_s + "\n\t contributors_enabled: " + contributors_enabled.to_s
		res+= "\n\t favourites_count: " + favourites_count.to_s + "\n\t statuses_count: " + statuses_count.to_s 
		res+= "\n\t friends_count: " + friends_count.to_s + "\n\t time_zone: " + time_zone.to_s + "\n\t utc_offset: " + utc_offset.to_s
		res+= "\n\t lang: " + lang.to_s  + "\n\t protected: " + prot.to_s + "\n\t followers_count: " + followers_count.to_s 
		res+= "\n\t geo_enabled: " + geo_enabled.to_s + "\n\t notifications: " + notifications.to_s + "\n\t verified: " + verified.to_s
		res+= "\n\t id_str: " + id_str.to_s + "\n\t default_profile: " + default_profile.to_s + "\n\t default_profile_image: " 
		res+= default_profile_image.to_s + "\n\t follow_request_sent: " + follow_request_sent.to_s + "\n\t is_translator: " 
		res+= is_translator.to_s + "\n\t listed_count: " + listed_count.to_s + "\n\t profile_background_image_url_https: " 
		res+= profile_background_image_url_https.to_s + "\n\t profile_image_url_https: " + profile_image_url_https.to_s
		res+= "\n\t profile_use_background_image: " + profile_use_background_image.to_s + "\n\t show_all_inline_media: " 
		res+= show_all_inline_media.to_s + "\n\t following: " + following.to_s                                     

		res
	end

end