# random_converter_spec.rb

require_relative '../lib/business/converter/random_converter'
require_relative '../lib/model/USMF/USMF'
require_relative '../lib/model/USMF/link'
require_relative '../lib/model/USMF/to_user'
require_relative '../lib/model/USMF/user'
require_relative '../lib/helper/DAO'

describe RandomConverter, "#to_usmf" do

  it "returns a usmf that should be equals to the test_usmf" do

    dao = DAO.new 'rpg'

    status = "12453243@juanito@Poesia es la union de dos palabras que uno nunca supuso que pudieran juntarse, y que forman algo asi como un misterio."
    puts 'Status retrieved'

    status.should_not == nil

    rc = RandomConverter.new
    real = rc.to_usmf status

    #build a usmf with the status, we need to parse the same phrase

    test = USMF.new
    puts 'Checking Status...'
    test.service = 'Random'
    real.service.should == test.service
    test.id = '12453243'
    real.id.should == test.id
    test.geo = nil
    real.geo.should == test.geo
    test.application = nil
    real.application.should == test.application
    test.location = nil
    real.location.should == test.location
    test.date = nil
    real.date.should == test.date
    test.source = nil
    real.source.should == test.source
    test.text = 'Poesia es la union de dos palabras que uno nunca supuso que pudieran juntarse, y que forman algo asi como un misterio.'
    real.text.should == test.text
    test.keywords = nil
    real.keywords.should == test.keywords
    test.category = nil
    real.category.should == test.category
    test.duration = nil
    real.duration.should == test.duration
    test.likes = nil
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
    user.name = 'juanito'
    real.user.name.should == user.name
    user.real_name = nil
    real.user.real_name.should == user.real_name
    user.id = nil
    real.user.id.should == user.id
    user.language = nil
    real.user.language.should == user.language
    user.utc = nil
    real.user.utc.should == user.utc
    user.geo = nil
    real.user.geo.should == user.geo
    user.description = nil
    real.user.description.should == user.description
    user.avatar = nil
    real.user.avatar.should == user.avatar
    user.location = nil
    real.user.location.should == user.location
    user.subscribers = nil
    real.user.subscribers.should == user.subscribers
    user.subscriptions = nil
    real.user.subscriptions.should == user.subscriptions
    user.postings = nil
    real.user.postings.should == user.postings
    user.profile = nil
    real.user.profile.should == user.profile
    user.website = nil
    real.user.website.should == user.website

    puts 'User OK'

    puts 'Checking Entities...'
    links = []
    links.should == real.links


    to_u = []
    to_u.should == real.to_users

    puts 'Entities OK'

  end

end

#"124532435@angel@La poesia no tiene tiempo, el que la lee la rescata, la hace presente y luego la regresa a su eternidad."
