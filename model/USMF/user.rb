class User

	attr_accessor :name,:real_name,:id,:language,:utc,:geo,:description,:avatar,:location,:subscribers,:subscriptions,
	:postings,:profile,:website

	def to_s
		res = "\nname: " + name.to_s + "\nreal_name: " + real_name.to_s + "\nid: " + id.to_s + "\nlanguage: " + language.to_s + "\nutc: " + utc.to_s + "\ngeo: " + geo.to_s + "\ndescription: " + description.to_s + "\navatar: " + avatar.to_s + "\nlocation: " + location.to_s + "\nsubscribers: " + subscribers.to_s + "\nsubscriptions: " + subscriptions.to_s + "\npostings: " + postings.to_s + "\nprofile: " + profile.to_s + "\nwebsite: " + website.to_s
		res
	end

end