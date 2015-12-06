# Casino Project:

# Basic Objectives:
# 1. Start game player has a name and an initial bank roll
# 2. Player can go to different games via menu
# 	a. Slots
# 	b. High / Low
# 3. Player places bet and wins / loses (hint: rand)
# 4. Player's bankroll goes up and down with wins and losses

# Bonus objective:
# 1. Player's bankroll persists while moving from game to game
# 2. Random events occur when changing games that can increase or decrease player's bank roll
# 3. Roulette
# 4. Build a card deck
# 5. Card games

# class Casino

# def initialize 
# 	prompt_num_players
# 	players_name
# 	# perform_game
# end

# attr_accessor :prompt_num_players, :players_name, #:bank

def prompt_num_players
	puts "Welcome to the Casino"
	puts "How many players?"
	players = gets.to_i
	puts "You are #{players} playing tonight"
end

# def players_name
# 	puts "What is/are the player(s) name(s)?"
# 	gamers_name = gets.chomp
# 	puts "Ok we have #{gamers_name} playing tonight!"
# end


prompt_num_players

@Players

class Players
	attr_accessor :name, :bankroll

	def initialize 
		@name = name
		@bankroll = bankroll
	end
	
	def players_name(name, bankroll)
		puts "What is/are the player(s) name(s)?"
		gamers_name = gets.chomp
		puts "Ok we have #{gamers_name} playing tonight!"
	end
end

