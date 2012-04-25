class Geo
	attr_accessor :type, :coordinates

	def to_s
		res = "\n\t type: " + type.to_s + "\n\t coordinates: " + coordinates.to_s
		res 
	end
end