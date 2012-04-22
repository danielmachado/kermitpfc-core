class Size
	attr_accessor :height, :resize, :weight
	def to_s
		res = "\n\t height: " + height.to_s + "\n\t resize: " + resize.to_s + "\n\t weight: " + weight.to_s   
		res
	end
end