class Poker

	def self.check(hand)
		return :pair if pair(hand)
		return :third if third(hand)
		return :twin_pairs if twin_pairs(hand)
		return :full if full(hand)
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
		counts = {0 => 0}
		(1..12).each{|n|
			counts[n] = hand.count{|card| card.num == n } 
		}
		counts
	end

	
end