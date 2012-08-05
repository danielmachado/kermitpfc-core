# twitter_converter_spec.rb
require_relative '../business/converter/twitter_converter'
require_relative '../model/USMF/USMF'
require_relative '../model/USMF/link'
require_relative '../model/USMF/to_user'
require_relative '../model/USMF/user'
require_relative '../helper/DAO'

describe TwitterConverter, "#to_usmf" do
  
  it "returns a usmf that should be equals to the test_usmf" do

  	status = '{"entities":{"hashtags":[],"user_mentions":[{"screen_name":"Tukkka_","indices":[0,8],"id_str":"185248725","name":"Marta Carrera","id":185248725}],"urls":[]},"text":"@Tukkka_ Gracias. Pasar de tener a tus dos equipos en 2 y 2B a tenerlos en 2B y 3 respectivamente. Volveremos a ser grande, no lo dudes.","place":null,"in_reply_to_screen_name":"Tukkka_","truncated":false,"in_reply_to_status_id_str":"219021134480412673","favorited":false,"retweet_count":0,"source":"web","in_reply_to_user_id_str":"185248725","id_str":"219021815631183872","coordinates":null,"geo":null,"contributors":null,"created_at":"Sat Jun 30 10:57:24 +0000 2012","in_reply_to_user_id":185248725,"user":{"lang":"es","profile_background_image_url_https":"https:\/\/si0.twimg.com\/profile_background_images\/573127406\/n5v3a4dvj4n3f91o7sru.jpeg","profile_sidebar_fill_color":"DDEEF6","screen_name":"DXTaldia","show_all_inline_media":false,"listed_count":1,"profile_sidebar_border_color":"C0DEED","statuses_count":1636,"following":null,"description":"Blanco. Red. Teddy Bear. Industrial. Knickerbocker. Ranger. Where amazing happens. Colaborador de f\u00fatbol sala en @RepasoDeportivo.","default_profile":false,"profile_use_background_image":true,"id_str":"508941121","is_translator":false,"profile_text_color":"333333","profile_image_url_https":"https:\/\/si0.twimg.com\/profile_images\/2287684652\/t4u7vmx6atmibl3pv1rv_normal.jpeg","profile_background_image_url":"http:\/\/a0.twimg.com\/profile_background_images\/573127406\/n5v3a4dvj4n3f91o7sru.jpeg","time_zone":null,"created_at":"Wed Feb 29 15:21:06 +0000 2012","followers_count":99,"profile_image_url":"http:\/\/a0.twimg.com\/profile_images\/2287684652\/t4u7vmx6atmibl3pv1rv_normal.jpeg","verified":false,"profile_link_color":"","protected":false,"url":null,"default_profile_image":false,"name":"Mr. Dxt","contributors_enabled":false,"geo_enabled":false,"favourites_count":13,"friends_count":203,"profile_background_color":"","id":508941121,"follow_request_sent":null,"notifications":null,"profile_background_tile":true,"utc_offset":null,"location":""},"retweeted":false,"id":219021815631183872,"in_reply_to_status_id":219021134480412673}';



  	puts 'Status retrieved'

	status.should_not == nil
		
	tc = TwitterConverter.new true
	real = tc.to_usmf status

	#build a usmf with the status, we need to parse the same tweet 

	test = USMF.new true
	puts 'Checking Status...'
	test.service = 'Twitter'
	real.service.should == test.service
	test.id = '219021815631183872'
	real.id.should == test.id
	test.geo = nil
	real.geo.should == test.geo
	test.application = 'web'
	real.application.should == test.application
	test.location = nil
	real.location.should == test.location
	test.date = 'Sat Jun 30 10:57:24 +0000 2012'
	real.date.should == test.date
	test.source = 'https://twitter.com/DXTaldia/status/219021815631183872'
	real.source.should == test.source
	test.text = '@Tukkka_ Gracias. Pasar de tener a tus dos equipos en 2 y 2B a tenerlos en 2B y 3 respectivamente. Volveremos a ser grande, no lo dudes.'
	real.text.should == test.text
	test.keywords = ""
	real.keywords.should == test.keywords
	test.category = nil
	real.category.should == test.category
	test.duration = nil
	real.duration.should == test.duration
	test.likes = 0
	real.likes.should == test.likes
	test.dislikes = nil
	real.dislikes.should == test.dislikes
	test.favorites = nil
	real.favorites.should == test.favorites
	test.comments = nil
	real.comments.should == test.comments
	test.rates = nil
	test.rating = nil
	test.min_rating = nil
	test.max_rating = nil
	real.rates.should == test.rates
	real.rating.should == test.rating
	real.min_rating.should == test.min_rating
	real.max_rating.should == test.max_rating
	puts 'Status OK'

	user = User.new
	puts 'Checking User...'
	user.name = 'DXTaldia'
	real.user.name.should == user.name
	user.real_name = 'Mr. Dxt'
	real.user.real_name.should == user.real_name
	user.id = '508941121'
	real.user.id.should == user.id
	user.language = 'es'
	real.user.language.should == user.language
	user.utc = nil
	real.user.utc.should == user.utc
	user.geo = nil
	real.user.geo.should == user.geo
	user.description = "Blanco. Red. Teddy Bear. Industrial. Knickerbocker. Ranger. Where amazing happens. Colaborador de f\u00fatbol sala en @RepasoDeportivo."
	real.user.description.should == user.description
	user.avatar = 'https://si0.twimg.com/profile_images/2287684652/t4u7vmx6atmibl3pv1rv_normal.jpeg'
	real.user.avatar.should == user.avatar
	user.location = ''
	real.user.location.should == user.location
	user.subscribers = 99
	real.user.subscribers.should == user.subscribers
	user.subscriptions = 203
	real.user.subscriptions.should == user.subscriptions
	user.postings = 1636
	real.user.postings.should == user.postings
	user.profile = "https://twitter.com/#!/DXTaldia"
	real.user.profile.should == user.profile
	user.website = nil
	real.user.website.should == user.website

	puts 'User OK'

	puts 'Checking Entities...'
	links = []
	links.should == real.links

	
	to_u = []
	
  	
  	tu = ToUser.new

	tu.name = 'Tukkka_'
	tu.id = '185248725'
	tu.service = 'reply'
	tu.title = '219021134480412673'
	tu.thumbnail = nil
	tu.href = 'https://twitter.com/Tukkka_/status/219021134480412673'
	to_u << tu

	to_u.each do |x|

		real.to_users[0].id.should == x.id
		real.to_users[0].name.should == x.name
		real.to_users[0].service.should == x.service
		real.to_users[0].title.should == x.title
		real.to_users[0].thumbnail.should == x.thumbnail
		real.to_users[0].href.should == x.href

	end

	puts 'Entities OK'

  end

end