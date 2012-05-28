class UserMention
	attr_accessor :screen_name, :id_str

	def to_s
		res = "\n\tscreen_name: " + screen_name.to_s + "\n\tid_str: " + id_str.to_s
		res    
	end
end