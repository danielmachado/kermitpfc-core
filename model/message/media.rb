class Media
		attr_accessor :type, :url, :media_url

		def to_s
			res = "\n\t type: " + type.to_s + "\n\t url: " + url.to_s + "\n\t media_url: " + media_url.to_s
			res
		end

end