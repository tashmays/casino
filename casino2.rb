class Casino 

	def initialize
			intro
	end

	def intro
		puts "Welcome to Casino Royale, where the winners are"
	end
end


class Players

	def initialize
		num_players
		name_players
		
	end

	def num_players
		puts "How many players will play?"
		players = gets.to_i
		puts "There are #{players} playing tonight"
	end

	def name_players
		puts "What is your name?"
		@name = gets.chomp.to_s
		puts "Yay! We have #{@name} playing tonight!"
	end
end

class Bank
	def initialize 
		bank_roll
	end

	def bank_roll
		puts "What is your starting bank roll?[for example 100]"
		@bank = gets.chomp.to_i
		puts "#{@name}'s starting bank roll is $#{@bank}"
	end
end

class Games
	def initialize
		game_select
	end

	def game_select
		puts "Please select a game below (1 - 2)"
		puts "1. High/Low"
		puts "2. Slot"
		game_select = gets.strip.to_i
		if game_select == 1
			puts high_low
		elsif game_select == 2
			puts intro_slots
		else
			puts "You did not make a valid selection, please select 1 - 2"
		end
	end

def high_low
  puts "Welcome to High Low."
  puts "How much do you have to play with?"
  @bank = gets.chomp.to_i
  bet_ammount
end

#===== Bet Ammount =====================
def bet_ammount
  puts "How much would you like to bet?"
  @bet = gets.chomp.to_i
  cover_check
end

#======= Cover Check ==========
def cover_check
  if @bet > @bank
    puts "You can't cover yourself"
    bet_ammount
  else
    high_low_game
  end
end



def add_to_bank
  puts "adding"
   @bank = @bank + @bet
   puts "Your new bank is $#{@bank}"
end
def take_from_bank
  puts "subtracting"
   @bank = @bank - @bet
   puts "Your new bank is $#{@bank}"
end

def first_random_number
  arr1 = []
  (1..10).each do |i|
    arr1 << i
    #puts i
  end
  @first_number = arr1.sample
  puts @first_number
  high_or_low
end

# def check
#   if @second_number == @first_number
#     puts "Redrawing number"
#     second_random_number
#   else
#   end
# end

def second_random_number
  arr2 = []
  (1..10).each do |i|
    arr2 << i
    #puts i
  end
  @second_number = arr2.sample
  if @second_number == @first_number
    puts "Redrawing number"
    second_random_number
  else
  end
  puts @second_number
  correct
end

def high_low_game
  arr1 = []
  arr2 = []
  puts "well give you a number between 1 and 10."
  puts "You have to guess if its higher or lower"
  first_random_number
end



def high_or_low
  puts "Will the next number be higher or lower? [h or l]"
  @ans = gets.chomp.downcase.to_s
  second_random_number
end

def higher
  puts "Is #{@second_number} higher than #{@first_number}?"
  if @first_number < @second_number
    puts "correct"
    add_to_bank

  else @second_number < @first_number
    puts "incorrct"
    take_from_bank
  end
end

def lower
  puts "Is #{@second_number} lower than #{@first_number}?"
  if @first_number > @second_number
    puts "correct"
    add_to_bank
  else @second_number > @first_number
    puts "incorrct"
    take_from_bank
  end
end

def correct
  if @ans == 'h'
    higher
    # puts "Is #{@second_number} higher than #{@first_number}?"
    # if @first_number < @second_number
    #   puts "correct"
    #   add_to_bank
    #
    # else @second_number < @first_number
    #   puts "incorrct"
    #   take_from_bank
    # end
    play_again
  elsif @ans == 'l'
    lower
    # puts "Is #{@second_number} lower than #{@first_number}?"
    # if @first_number > @second_number
    #   puts "correct"
    #   add_to_bank
    # else @second_number > @first_number
    #   puts "incorrct"
    #   take_from_bank
    # end
    play_again
  else
    puts "wrong choice there boy."
  end
end
def exit_hl
  puts"Goodbye"
  exit(0)
end

def play_again
  puts "Would you like to play again: press 1 for yes and 2 for no"
  answer = gets.strip.to_i
    if answer == 1
      bet_ammount
    elsif answer == 2
      exit_hl
    else 
      puts "Please put a valid response"
      play_again
    end
	end
end

def intro_slots
  puts"Welcome to the world of slots."
end
def slot_bank
  puts "How much are we playing with"
  @bank = gets.chomp.to_i
  puts "Your bank is $#{@bank}"
end
  
def slot_bet
  puts "How much do you want to bet?"
  @bet = gets.chomp.to_i
  puts "You are betting $#{@bet}"
  
end

def slots(s1, s2, s3)

  if s1==s2 && s2==s3
    tripple
  elsif s1==s2 || s2==s3 || s1==s3
    double
  else
    loss
  end
end

def tripple
  @bank = @bet * 2 + @bank 
  puts "You got a tripple here is your new bank $#{@bank}"
end

def double
  @bank = @bet + @bank

  puts "You got a double and here is your new bank $#{@bank}"
  
end

def loss
  @bank = @bank - @bet
  puts "Well, this time you lost $#{@bet} from you bank"
  puts "Your new bank is #{@bank}"
end

def run_slots
  arr1 = []
  (1..9).each do |i|
    arr1 << i
    #puts i
  end
  s1 = arr1.sample
  arr2 = []
  (1..9).each do |i|
    arr2 << i
    #puts i
  end
  s2 = arr2.sample
  arr3 = []
  (1..9).each do |i|
    arr3 << i
    #puts i
  end
  s3 = arr3.sample
  puts s1
  puts s2
  puts s3
  slots(s1, s2, s3)
end

def exit_slot
  puts"Goodbye"
  exit(0)
end

def play_again
  puts "Would you like to play again: press 1 for yes and 2 for no"
  answer = gets.strip.to_i
    if answer == 1
      slot_bet
      run_slots
      play_again
    elsif answer == 2
      exit_slot
    else 
      puts "Please put a valid response"
      play_again
    end
	end 

intro_slots
slot_bank
slot_bet
run_slots
play_again

 

Casino.new
Players.new
Bank.new
Games.new

