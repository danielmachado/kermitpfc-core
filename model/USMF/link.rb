# @author Daniel Machado Fernandez
# @version 1.0
#
# A Link model
class Link

	attr_accessor :service,:title,:thumbnail,:href

	# Unify the fields into a string
  	#
  	# @return res [String] resultant string
	def to_s
		res = "\nservice: " + service.to_s + "\ntitle: " + title.to_s + "\nthumbnail: " + thumbnail.to_s + "\nhref: " + href.to_s
		res
	end

  	# Unify the fields into a hash
  	#
  	# @return res [Hash] resultant hash
	def to_hash
		res = {  
				"service" => service,
				"title" => title,
				"thumbnail" => thumbnail,
				"href" => href
			  }
		res
	end

end