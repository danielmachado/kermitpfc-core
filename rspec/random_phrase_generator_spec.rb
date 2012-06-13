# random_phrase_generator_spec.rb
require_relative '../business/random_phrase_generator'

describe RandomPhraseGenerator do
  describe "#generate" do
    it "returns a random phrase" do

		rpg = RandomPhraseGenerator.new
		phrase = rpg.generate
		phrase.should_not nil
		phrase.class.should == String

    end
  end
end