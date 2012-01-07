#! /usr/bin/ruby
# 
# Main Module
# 
# (C) 2009, Carlos Puchol, cpg@rocketmail.com
# 
# This module the main code to drive the playing and also the simulation of Black Jack games.
# 
# This code is released under the GNU GPLv3 license For details see this: http://www.gnu.org/licenses/gpl-3.0.html
# 


require 'blackjack'

def print_results(results, start, finish, level, concise_output = false)
	h = 0
	p = 0
	d = 0 # draw
	total = 0
	diff = finish - start
	results.each do |r|
		case r
		when 'h'
			h += 1
		when 'p'
			p += 1
		when 'd'
			d += 1
		end
		total += 1
	end
        if concise_output
                printf("%d, %2.2f%%, %2.2f%%\n", level, (h*100.0)/total, (p*100.0)/total)
        else
                printf("Results for strategy \"Stop at %d\" ====================\n", level)
                printf("\tHouse wins:\t%2.2f%% (#{h})\n", (h*100.0)/total)
                printf("\tYour  wins:\t%2.2f%% (#{p})\n", (p*100.0)/total)
                printf("\tDraws:     \t% 2.2f%% (#{d})\n", (d*100.0)/total)
                printf("\tTotal:     \t%d @ % 2.2f games per second\n", total, total/diff)
        end
end

def benchmark_blackjack(level, concise_output = false)
	start = Time.now
	r = []
	1.upto(10000) do
	      g = Game.new
	      r << g.play(level)
	end
	finish = Time.now

	print_results(r, start, finish, level, concise_output)
end


def do_all_benchmarks(concise_output = false)
        if concise_output
                printf("Stop at, %% House Wins, %% Player Wins\n")
        end
	# run past 21 - make sure after that the player always loses
	8.upto(22) do |level|
		benchmark_blackjack(level, concise_output)
	end
end

do_all_benchmarks(true)
