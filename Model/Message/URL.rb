class URL
		attr_accessor :indices, :url, :display_url, :expanded_url, :media_url

		def to_s
			res = "\n\t indices: " + indices.to_s + "\n\t url: " + url.to_s + "\n\t display_url: " + display_url.to_s 
			res+= "\n\t expanded_url: " + expanded_url.to_s + "\n\t media_url: " + media_url.to_s
			res     
		end
end