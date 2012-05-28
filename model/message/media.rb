class Media
		attr_accessor :type, :url

		def to_s
			res = "\n\t type: " + type.to_s + "\n\t url: " + url.to_s
			res
		end

end