class Contributor
	attr_accessor :id_str, :screen_name 

	def to_s
		res = "\n\t id_str: " + id_str.to_s + "\n\t screen_name: " + screen_name.to_s 
	end

end