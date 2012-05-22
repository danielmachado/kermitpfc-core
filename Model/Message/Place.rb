class Place
	attr_accessor :id, :url, :name, :full_name,
	:place_type, :country_code, :country, :bounding_box, :atributes

	#bounding_box is a Geo

	def to_s
		res = "\n\t id: " + id.to_s + "\n\t url: " + url.to_s + "\n\t name: " + name.to_s + "\n\t full_name: " + full_name.to_s
		res+= "\n\t place_type: " + place_type.to_s + "\n\t country_code: " + country_code.to_s + "\n\t country: " + country.to_s
		res+= "\n\t atributes: " + atributes.to_s + "\n\t BOUNDING BOX: " + bounding_box.to_s
		res         
	end

end