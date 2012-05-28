class Hashtag
		attr_accessor :text

		def to_s
			res = "\n\t text: " + text.to_s
			res  
		end
end