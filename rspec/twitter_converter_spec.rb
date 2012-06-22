# twitter_converter_spec.rb
require_relative '../business/converter/twitter_converter'
require_relative '../model/USMF/USMF'
require_relative '../model/USMF/link'
require_relative '../model/USMF/to_user'
require_relative '../model/USMF/user'
require_relative '../helper/DAO'

describe TwitterConverter, "#to_usmf" do
  
  it "returns a usmf that should be equals to the test_usmf" do

  	dao = DAO.new 'twitter', 'test'

  	status = dao.db.lrange 'tweets', 0,0
  	puts 'Status retrieved'

	status.should_not == nil
		
	tc = TwitterConverter.new 'test'
	real = tc.to_usmf status[0]

	#build a usmf with the status, we need to parse the same tweet 

	test = USMF.new 'test'
	puts 'Checking Status...'
	test.service = 'Twitter'
	real.service.should == test.service
	test.id = '212119420636635136'
	real.id.should == test.id
	test.geo = nil
	real.geo.should == test.geo
	test.application = '\\u003Ca href=\\\"http:\\/\\/twitter.com\\/#!\\/download\\/iphone\\\" rel=\\\"nofollow\\\"\\u003ETwitter for iPhone\\u003C\\/a\\u003E'
#	real.application.should == test.application
	test.location = nil
	real.location.should == test.location
	test.date = 'Mon Jun 11 09:49:45 +0000 2012'
	real.date.should == test.date
	test.source = 'https://twitter.com/DagLar_Merve/status/212119420636635136'
	real.source.should == test.source
	test.text = 'BO\\u011eA: Sizin ilginize ihtiyac\\u0131 olan biri var .. Onu g\\u00f6rmemezlikten gelmeyin! Ya\\u015fad\\u0131\\u011f\\u0131n\\u0131z baz\\u0131 eski g\\u00fcnlere geri d\\u00f6nm ...'
#	real.text.should == test.text
	test.keywords = ""
	real.keywords.should == test.keywords
	test.category = nil
	real.category.should == test.category
	test.duration = nil
	real.duration.should == test.duration
	test.likes = 127
	real.likes.should == test.likes
	test.dislikes = nil
	real.dislikes.should == test.dislikes
	test.favorites = 10
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
	user.name = 'DagLar_Merve'
	real.user.name.should == user.name
	user.real_name = 'Merve Da\\u011flar'
#	real.user.real_name.should == user.real_name
	user.id = '527622545'
	real.user.id.should == user.id
	user.language = 'tr'
	real.user.language.should == user.language
	user.utc = nil
	real.user.utc.should == user.utc
	user.geo = nil
	real.user.geo.should == user.geo
#	user.description = "\\u0130stanbul \\u00dcniversitesi Radyo&Televizyon okuyor\"
#	real.user.description.should == user.description
	user.avatar = 'https://si0.twimg.com/profile_images/2251889444/image_normal.jpg'
	real.user.avatar.should == user.avatar
#	user.location = '\\u0130stanbul'
#	real.user.location.should == user.location
	user.subscribers = 88
	real.user.subscribers.should == user.subscribers
	user.subscriptions = 118
	real.user.subscriptions.should == user.subscriptions
	user.postings = 433
	real.user.postings.should == user.postings
	user.profile = "https://twitter.com/#!/DagLar_Merve"
	real.user.profile.should == user.profile
	user.website = 'https://www.facebook.com/#!/merve.daglar1'
	real.user.website.should == user.website

	puts 'User OK'

	puts 'Checking Entities...'
	links = []
	links.should == real.links

	
	to_u = []
	
  	
  	tu = ToUser.new

	tu.name = 'burcunuznediyor'
	tu.id = '305062697'
	tu.service = 'mention'
	tu.title = nil
	tu.thumbnail = nil
	tu.href = nil
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


# "{\"entities\":{
# 	\"user_mentions\":[{
# 		\"indices\":[3,19],
# 		\"id_str\":\"305062697\",
# 		\"screen_name\":\"burcunuznediyor\",
# 		\"name\":\"burcunuz ne diyor\",
# 		\"id\":305062697}],
# 	\"urls\":[],
# 	\"hashtags\":[]},
# \"in_reply_to_screen_name\":null,
# \"text\":\"RT @burcunuznediyor: BO\\u011eA: Sizin ilginize ihtiyac\\u0131 olan biri var .. Onu g\\u00f6rmemezlikten gelmeyin! Ya\\u015fad\\u0131\\u011f\\u0131n\\u0131z baz\\u0131 eski g\\u00fcnlere geri d\\u00f6nm ...\",
# \"id_str\":\"212119420636635136\",
# \"place\":null,
# \"retweeted_status\":{
# 	\"entities\":{
# 		\"user_mentions\":[],
# 		\"urls\":[],
# 		\"hashtags\":[]},
# 	\"in_reply_to_screen_name\":null,
# 	\"text\":\"BO\\u011eA: Sizin ilginize ihtiyac\\u0131 olan biri var .. Onu g\\u00f6rmemezlikten gelmeyin! Ya\\u015fad\\u0131\\u011f\\u0131n\\u0131z baz\\u0131 eski g\\u00fcnlere geri d\\u00f6nmek istiyorsunuz ..\",
# 	\"id_str\":\"212109054057783296\",
# 	\"place\":null,
# 	\"in_reply_to_status_id\":null,
# 	\"contributors\":null,
# 	\"retweet_count\":127,
# 	\"favorited\":false,
# 	\"truncated\":false,
# 	\"source\":\"web\",
# 	\"in_reply_to_status_id_str\":null,
# 	\"created_at\":\"Mon Jun 11 09:08:33 +0000 2012\",
# 	\"in_reply_to_user_id_str\":null,
# 	\"in_reply_to_user_id\":null,
# 	\"user\":{
# 		\"lang\":\"tr\",
# 		\"profile_background_image_url\":\"http:\\/\\/a0.twimg.com\\/images\\/themes\\/theme15\\/bg.png\",
# 		\"id_str\":\"305062697\",
# 		\"default_profile\":false,
# 		\"profile_link_color\":\"0084B4\",
# 		\"is_translator\":false,
# 		\"statuses_count\":4609,
# 		\"following\":null,
# 		\"profile_background_image_url_https\":\"https:\\/\\/si0.twimg.com\\/images\\/themes\\/theme15\\/bg.png\",
# 		\"friends_count\":302,
# 		\"profile_background_color\":\"022330\",
# 		\"description\":\"istanbul izmir..\",
# 		\"notifications\":null,
# 		\"profile_background_tile\":false,
# 		\"time_zone\":\"Quito\",
# 		\"default_profile_image\":false,
# 		\"profile_sidebar_fill_color\":\"C0DFEC\",
# 		\"contributors_enabled\":false,
# 		\"geo_enabled\":false,
# 		\"favourites_count\":86,
# 		\"created_at\":\"Wed May 25 15:39:57 +0000 2011\",
# 		\"profile_image_url_https\":\"https:\\/\\/si0.twimg.com\\/profile_images\\/2172786033\\/368PHOTO_normal.jpg\",
# 		\"screen_name\":\"burcunuznediyor\",
# 		\"follow_request_sent\":null,
# 		\"profile_sidebar_border_color\":\"a8c7f7\",
# 		\"protected\":false,
# 		\"url\":null,
# 		\"name\":\"burcunuz ne diyor\",
# 		\"show_all_inline_media\":true,
# 		\"verified\":false,
# 		\"profile_use_background_image\":true,
# 		\"followers_count\":65064,
# 		\"profile_image_url\":\"http:\\/\\/a0.twimg.com\\/profile_images\\/2172786033\\/368PHOTO_normal.jpg\",
# 		\"id\":305062697,
# 		\"listed_count\":81,
# 		\"utc_offset\":-18000,
# 		\"profile_text_color\":\"333333\",
# 		\"location\":\"\"},
# 	\"retweeted\":false,
# 	\"id\":212109054057783296,
# 	\"coordinates\":null,
# 	\"geo\":null}
# \"in_reply_to_status_id\":null,
# \"contributors\":null,
# \"retweet_count\":127,
# \"favorited\":false,
# \"truncated\":true,
# \"source\":\"\\u003Ca href=\\\"http:\\/\\/twitter.com\\/#!\\/download\\/iphone\\\" rel=\\\"nofollow\\\"\\u003ETwitter for iPhone\\u003C\\/a\\u003E\",
# \"in_reply_to_status_id_str\":null,
# \"created_at\":\"Mon Jun 11 09:49:45 +0000 2012\",
# \"in_reply_to_user_id_str\":null,
# \"in_reply_to_user_id\":null,
# \"user\":{
# 	\"lang\":\"tr\",
# 	\"profile_background_image_url\":\"http:\\/\\/a0.twimg.com\\/images\\/themes\\/theme1\\/bg.png\",
# 	\"id_str\":\"527622545\",
# 	\"default_profile\":true,
# 	\"profile_link_color\":\"0084B4\",
# 	\"is_translator\":false,
# 	\"statuses_count\":433,
# 	\"following\":null,
# 	\"profile_background_image_url_https\":\"https:\\/\\/si0.twimg.com\\/images\\/themes\\/theme1\\/bg.png\",
# 	\"friends_count\":118,
# 	\"profile_background_color\":\"C0DEED\",
# 	\"description\":\"\\u0130stanbul \\u00dcniversitesi Radyo&Televizyon okuyor\",
# 	\"notifications\":null,
# 	\"profile_background_tile\":false,
# 	\"time_zone\":null,
# 	\"default_profile_image\":false,
# 	\"profile_sidebar_fill_color\":\"DDEEF6\",
# 	\"contributors_enabled\":false,
# 	\"geo_enabled\":true,
# 	\"favourites_count\":10,
# 	\"created_at\":\"Sat Mar 17 16:38:37 +0000 2012\",
# 	\"profile_image_url_https\":\"https:\\/\\/si0.twimg.com\\/profile_images\\/2251889444\\/image_normal.jpg\",
# 	\"screen_name\":\"DagLar_Merve\",
# 	\"follow_request_sent\":null,
# 	\"profile_sidebar_border_color\":\"C0DEED\",
# 	\"protected\":false,
# 	\"url\":\"https:\\/\\/www.facebook.com\\/#!\\/merve.daglar1\",
# 	\"name\":\"Merve Da\\u011flar\",
# 	\"show_all_inline_media\":false,
# 	\"verified\":false,
# 	\"profile_use_background_image\":true,
# 	\"followers_count\":88,
# 	\"profile_image_url\":\"http:\\/\\/a0.twimg.com\\/profile_images\\/2251889444\\/image_normal.jpg\",
# 	\"id\":527622545,
# 	\"listed_count\":0,
# 	\"utc_offset\":null,
# 	\"profile_text_color\":\"333333\",
# 	\"location\":\"\\u0130stanbul\"},
# \"retweeted\":false,
# \"id\":212119420636635136,
# \"coordinates\":null,
# \"geo\":null}"