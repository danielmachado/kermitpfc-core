# twitter_converter_spec.rb
require_relative '../business/converter/twitter_converter'

describe TwitterConverter, "#to_usmf" do
  
  it "returns a usmf that should be equals to the test_usmf" do



  	dao = DAO.new 'twitter', 'test'

	status = dao.get_status
	puts 'Status retrieved'

	status.should != nil
		
	tc = TwitterConverter.new
	usmf = tc.to_usmf status

	#build a usmf with the status, we need to parse the same tweet 

  end

end