class Poker

	def self.check(hand)
		return :pair if pair(hand)
		return :third if third(hand)
		return :twin_pairs if twin_pairs(hand)
		return :full if full(hand)
		return :straight if straight(hand)
		return :colour if colour(hand)
		nil
	end

	def self.pair(hand) 
		only_one_pair(counts_appearances(hand))
	end

	def self.third(hand) 
		only_one_third(counts_appearances(hand))
	end

	def self.twin_pairs(hand) 
		two_pairs(counts_appearances(hand))
	end

	def self.full(hand) 
		counts_appearances(hand).values.count(2) == 1 && 
			counts_appearances(hand).values.count(3) == 1
	end

	def self.straight(hand)
		(counts_appearances(hand).values.count(1) == 5) && (max_value(hand) - min_value(hand) == 4)
	end

	def self.colour(hand)
		counts_suits(hand).values.count(5) == 1
	end

	def self.only_one_pair(counts_apps)
		counts_apps.values.count(2) == 1 && counts_apps.values.count(3) == 0 
	end

	def self.only_one_third(counts_apps)
		counts_apps.values.count(3) == 1 && counts_apps.values.count(2) == 0
	end

	def self.two_pairs(counts_apps)
		counts_apps.values.count(2) == 2 
	end

	def self.counts_appearances(hand)
		counts = {}
		(1..12).each{|n|
			counts[n] = hand.count{|card| card.num == n } 
		}
		counts
	end

	def self.counts_suits(hand)
		counts = {}
		[:diamonds, :pikes, :hearts, :clubs].each{|n|
			counts[n] = hand.count{|card| card.suit == n } 
		}
		counts
	end

	def self.max_value(hand)
		hand.max{|cardA, cardB|
			cardA.num <=> cardB.num
		}.num
	end

	def self.min_value(hand)
		hand.min{|cardA, cardB|
			cardA.num <=> cardB.num
		}.num
	end
	
end