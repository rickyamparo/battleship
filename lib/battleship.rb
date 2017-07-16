require "pry"

class Battleship

  def initialize
    @instructions = "This is how you play battleship"
    puts "Would you like to (p)lay a game of Battleship? Read the (i)nstructions or (q)uit?"
  end

  def decide_what_to_do
    player_choice = gets.chomp
    if player_choice == "i"
      puts @instructions
    elsif player_choice == "q"
      puts "You have quit the game"
      #design a way for players to quit
    elsif player_choice == "p"
      puts "Let's play a round of battleship"
      #deisgn a way to access the start of the game
    else
      puts "Please pick one of the three choices"
      puts "(p)lay, (i)nstructions or (q)uit"
      decide_what_to_do
    end
  end

end
