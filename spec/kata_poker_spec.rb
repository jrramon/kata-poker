require 'spec_helper'

# :pikes :clubs :hearts :diamonds
describe Poker, "#check" do
	let (:poker) {Poker.new}

	it "mano contine :pair" do
		hand = [ Card.new(1, :diamonds),
				 Card.new(2, :diamonds),
				 Card.new(3, :diamonds),
				 Card.new(3, :diamonds),
				 Card.new(1, :diamonds)]
		Poker.check(hand).should eq (:pair)
	end

end