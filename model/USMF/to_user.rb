class ToUser

	attr_accessor :name,:id,:service,:title,:thumbnail,:href

	def to_s
		res = "\nname: " + name.to_s + "\nid: " + id.to_s + "\nservice: " + service.to_s + "\ntitle: " + title.to_s + "\nthumbnail: " + thumbnail.to_s + "\nhref: " + href.to_s
		res
	end

end