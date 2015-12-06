


class Players
  attr_accessor :players_name, :players_wallet
  def initialize(players_name, players_wallet)
    #prompt_num_players
    @players_name = players_name
    @players_wallet = players_wallet

  end
  # def prompt_num_players
  #   puts  "How many players are you? Now Enter 1, 2, 3, 4"
  #   players = gets.to_i
  #   puts "You are #{players} playing tonight"
  # end

end

def players_name
  puts "Welcome to Powder Casino"
  puts "What is the players name?"
  players_name = gets.strip.to_s
  puts "Okay, Great, we have #{players_name} playing tonight"
  puts "How much would you like to start with?"
  players_wallet = gets.strip.to_i
  @player_one = Players.new(players_name, players_wallet)
  game_select
end
#un-do below
#players_name
#======== High Low Game code ========================
#===== Bet Ammount for High Low =====================
def bet_ammount
  puts "How much would you like to bet?"
  @bet = gets.chomp.to_i
  cover_check
end
#======= Cover Check ==========
def cover_check

  if @bet > @player_one.players_wallet
    puts "You can't cover yourself"
    high_low
  else
    high_low_game
  end
end

def add_to_bank
  puts "adding"
   @player_one.players_wallet = @player_one.players_wallet + @bet
   puts "Your new bank is $#{@player_one.players_wallet}"
end
def take_from_bank
  puts "subtracting"
   @player_one.players_wallet = @player_one.players_wallet - @bet
   puts "Your new bank is $#{@player_one.players_wallet}"
end

def high_low_game
  arr1 = []
  arr2 = []
  puts "well give you a number between 1 and 10."
  puts "You have to guess if its higher or lower"
  first_random_number
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
def high_or_low
  puts "Will the next number be higher or lower? [h or l]"
  @ans = gets.chomp.downcase.to_s
  second_random_number
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

def exit_hl
  puts"Goodbye"
  game_select
end

def play_again
  puts "Would you like to play again: press 1 for yes and 2 for no"
  answer = gets.chomp.to_i
    if answer == 1
      bet_ammount
    elsif answer == 2
      exit_hl
    else
      puts "Please put a valid response"
      play_again
    end
end


def high_low
  puts "Welcome to High Low."
  bet_ammount
end



#===========================================================
#================ Slots Code ===============================
def slot_bet
  puts "How much do you want to bet?"
  @bet = gets.chomp.to_i
  puts "You are betting $#{@bet}"
  run_slots

end
def slots_output(s1, s2, s3)

  if s1==s2 && s2==s3
    tripple
  elsif s1==s2 || s2==s3 || s1==s3
    double
  else
    loss
  end
end

def tripple
  @player_one.players_wallet = @bet * 2 + @player_one.players_wallet
  puts "You got a tripple here is your new bank $#{@player_one.players_wallet}"
  play_again_slots
end

def double
  @player_one.players_wallet = @bet + @player_one.players_wallet

  puts "You got a double and here is your new bank $#{@player_one.players_wallet}"
  play_again_slots

end

def loss
  @player_one.players_wallet = @player_one.players_wallet - @bet
  puts "Well, this time you lost $#{@bet} from you bank"
  puts "Your new bank is $#{@player_one.players_wallet}"
  play_again_slots
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
  slots_output(s1, s2, s3)
end
def exit_slot
  puts"Thanks for playing slots."
  game_select
end
def play_again_slots
  puts "Would you like to play again: press 1 for yes and 2 for no"
  answer = gets.strip.to_i
    if answer == 1
      slot_bet
      #run_slots
      #play_again
    elsif answer == 2
      exit_slot
    else
      puts "Please put a valid response"
      play_again
    end
end


def slots
  puts "Welcome to Slots"
  slot_bet
end

def exit_casino
  puts "Thanks for playing at Powder Casino"
  puts "#{@player_one.players_name}, you are taking home $#{@player_one.players_wallet}."
  exit(0)
end

def game_select
  puts "What game would you like to play partner?"
  puts "1. High Low (1 - 10)"
  puts "2. Slots"
  puts "3. Exit"
  select_choice = gets.chomp.to_i
  if select_choice == 1
    high_low
  elsif select_choice == 2
    slots
  elsif select_choice == 3
    exit_casino
  else
    puts "That's not a valid option"
    game_select
  end


end

players_name

Players.new