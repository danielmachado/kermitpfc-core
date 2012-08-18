# DAO_spec.rb
require_relative '../lib/helper/DAO'

describe DAO do
  
  describe "#connect_database" do
    it "stablish the connection with the database" do

		dao = DAO.new 'twitter'
		puts 'Testing Twitter DB...'
		dao.db.should_not == nil
		puts 'Twitter DB OK'
		dao = DAO.new 'rpg'
		puts 'Testing Random DB...'
		dao.db.should_not == nil
		puts 'Random DB OK'

    end
  end
  
  describe "#get_status" do
  	it "returns a status from the database" do

		dao = DAO.new 'twitter'
		puts 'Testing Twitter status...'
		dao.get_status.should_not == nil
		puts 'Twitter status OK'
		dao = DAO.new 'rpg'
		puts 'Testing Random phrase...'
		dao.get_status.should_not == nil
		puts 'Random phrase OK'  		

  	end
  end

  describe "#size" do
  	it "returns the number of items in the database" do
  		
  		dao = DAO.new 'twitter'
		puts 'Testing Twitter DB size...'
		dao.size.should >= 0
		puts 'Twitter DB size OK'
		dao = DAO.new 'rpg'
		puts 'Testing Random DB size...'
		dao.size.should >= 0
		puts 'Random DB size OK'

  	end
  end

  describe "#publish" do
  	it "publish a status in the websocket server" do

  		dao = DAO.new 'twitter'
		puts 'Testing Publisher...'
		dao.publish('Testing a method')

		puts 'Publisher OK'


  	end
  end

end