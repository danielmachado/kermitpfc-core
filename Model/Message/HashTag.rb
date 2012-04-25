class HashTag
		attr_accessor :indices, :text

		def to_s
			res = "\n\t indices: " + indices.to_s + "\n\t text: " + text.to_s
			res  
		end
end