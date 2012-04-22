class Media
		attr_accessor :type, :expanded_url, :large, :medium, :small, :thumb,
		:indices, :url, :media_url_https, :media_url, :display_url, :id, :id_str

		def to_s
			res = "\n\t type: " + type.to_s + "\n\t expanded_url: " + expanded_url.to_s + "\n\t LARGE: " + large.to_s
			res+= "\n\t SMALL: " + small.to_s + "\n\t MEDIUM: " + medium.to_s + "\n\t THUMB: " + thumb.to_s
			res+= "\n\t indices: " + indices.to_s + "\n\t url: " + url.to_s + "\n\t id_str: " + id_str.to_s        
			res
		end

end