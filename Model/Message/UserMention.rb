class UserMention
	attr_accessor :indices, :screen_name, :name, :id_str

	def to_s
		res = "\n\tindices: " + indices.to_s + "\n\tscreen_name: " + screen_name.to_s + "\n\tname: " + name.to_s
		res+= "\n\tid_str: " + id_str.to_s
		res    
	end
end