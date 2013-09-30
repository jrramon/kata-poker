class Poker

	def self.check(hand)
		return :pair if pair(hand)
		return :third if third(hand)
		nil
	end

	def self.pair(hand) 
		only_one_pair(counts_appearances(hand))
	end

	def self.third(hand) 
		only_one_third(counts_appearances(hand))
	end

	def self.counts_appearances(hand)
		counts = {0 => 0}
		(1..12).each{|n|
			counts[n] = hand.count{|card| card.num == n } 
		}
		counts
	end

	def self.only_one_pair(counts_apps)
		counts_apps.values.count(2) == 1 
	end

	def self.only_one_third(counts_apps)
		counts_apps.values.count(3) == 1 
	end
end