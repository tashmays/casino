# player class
# game class
# hi lo class
# slots class
# blackjack class
module GameMechanics
	def self.roll_die(num_dice = 2)
		Array.new(num_dice) {Rand(6) + 1 }
	end

	def self.deal_cards
	end
end

class Game
	# includes the Module^^
	include GameMechanics
	attr_accessor :player #, :dice if did @dice can only happen in Game class

	def initialize(player)
		@player = player
	end

	def run 
		puts "Player #{@player.name} is playing"
		#can also say @dice = 		can only happen in Game class
		puts GameMechanics.roll_die
	end
end

class Player
	attr_accessor :name, :bankroll

	def initialize 
		puts "Enter your name"
		@name = gets.strip
		puts "Enter your bankroll"
		@bankroll = gets.to_f
	end
end

# This code allows for mulitple players
player = Player.new 
player2 = Player.new
player3 = Player.new
player4 = Player.new

players << player << player2 << player3 << player4

puts "Which player do you want to use to startt the game type 1 - 4"
index = gets.to_i -1

game = Game.new(players[index])
game.run 

# This code is for a single player
# puts "The players name is #{player.name}"
# puts "The players bankroll is #{player.bankroll}"

# game = Game.new(player)
# game.run
