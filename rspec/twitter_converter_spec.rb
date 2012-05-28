# twitter_converter_spec.rb
require_relative '../business/converter/TwitterConverter'

describe TwitterConverter, "#to_message" do
  it "returns a message that should be equals to the test_message" do
    t = TwitterConverter.new
    m = t.from_redis
    
  end
end