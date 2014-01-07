# 
# Deck Module
# 
# (C) 2009, Carlos Puchol, cpg (at) rocketmail (dot) com
# 
# This module contains classes that model cards and decks
# There are two decks pre-configured (default to the usual used in poker)
# 
# This code is released under the GNU GPLv3 license For details see this: http://www.gnu.org/licenses/gpl-3.0.html
# 

class Deck

	POKER_SUIT = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
	SPANISH_SUIT = ['1', '2', '3', '4', '5', '6', '7', 'J', 'Q', 'K']

	def initialize(suit =POKER_SUIT)
		@cards = []
		1.upto(4) do
			@cards += suit
		end
		shuffle
	end
  
	def deal(how_many = 1)
		cl = []
		1.upto(how_many) do
			cl += [ @cards.pop ]
		end
                # FIXME: raise an error if we run out of cards in the deck
		cl.compact
	end

	def size
		@cards.length
	end

	private

	def shuffle
		@cards = @cards.sort_by {rand}
	end

end
