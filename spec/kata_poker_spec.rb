require 'spec_helper'

# :pikes :clubs :hearts :diamonds
describe Poker, "#check" do
	let (:poker) {Poker.new}

	it "mano no contine :pair" do
		hand = [ Card.new(1, :diamonds),
				 Card.new(2, :diamonds),
				 Card.new(3, :diamonds),
				 Card.new(5, :diamonds),
				 Card.new(1, :diamonds)]
		Poker.check(hand).should eq (:pair)
	end

	it "mano contine :pair" do
		hand = [ Card.new(1, :diamonds),
				 Card.new(2, :diamonds),
				 Card.new(3, :diamonds),
				 Card.new(3, :diamonds),
				 Card.new(1, :diamonds)]
		Poker.check(hand).should_not eq (:pair)
	end


	it "mano no contiene nada" do
		hand = [ Card.new(1, :diamonds),
				 Card.new(10, :diamonds),
				 Card.new(3, :pikes),
				 Card.new(6, :diamonds),
				 Card.new(5, :hearts)]
		Poker.check(hand).should eq (nil)
	end

	it "mano contiene :third" do
		hand = [ Card.new(1, :diamonds),
				 Card.new(3, :diamonds),
				 Card.new(3, :pikes),
				 Card.new(6, :diamonds),
				 Card.new(3, :hearts)]
		Poker.check(hand).should eq (:third)
	end

	it "mano contiene :twin_pairs" do
		hand = [ Card.new(1, :diamonds),
				 Card.new(3, :diamonds),
				 Card.new(3, :pikes),
				 Card.new(6, :diamonds),
				 Card.new(1, :hearts)]
		Poker.check(hand).should eq (:twin_pairs)
	end
end