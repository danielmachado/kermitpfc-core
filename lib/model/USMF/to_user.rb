# @author Daniel Machado Fernandez
# @version 1.0
#
# Models the ToUser relation
class ToUser

	attr_accessor :name,:id,:service,:title,:thumbnail,:href

	# Unify the fields into a string
  	#
  	# @return [String] resultant string
	def to_s
		res = "\nname: " + name.to_s + "\nid: " + id.to_s + "\nservice: " + service.to_s + "\ntitle: " + title.to_s + "\nthumbnail: " + thumbnail.to_s + "\nhref: " + href.to_s
		res
	end
	
	# Unify the fields into a hash
	#
	# @return [Hash] resultant hash
	def to_hash
		res = {
				"name" => name,
				"id" => id,
				"service" => service,
				"title" => title,
				"thumbnail" => thumbnail,
				"href" => href
			  }
		res
	end

end