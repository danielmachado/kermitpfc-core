class Link

	attr_accessor :service,:title,:thumbnail,:href

	def to_s
		res = "\nservice: " + service.to_s + "\ntitle: " + title.to_s + "\nthumbnail: " + thumbnail.to_s + "\nhref: " + href.to_s
		res
	end

end