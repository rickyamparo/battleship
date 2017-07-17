require "pry"
require './lib/gameboard'

class Battleship

  attr_reader :current_board, :instructions

  def initialize
    @instructions = "This is how you play battleship"
    @current_board = Gameboard.new
    puts "Would you like to (p)lay a game of Battleship? Read the (i)nstructions or (q)uit?"
  end

  def start_sequence
    player_choice = gets.chomp
    if player_choice == "i"
      puts @instructions
      start_sequence
    elsif player_choice == "q"
      puts "You have quit the game"
      #design a way for players to quit
    elsif player_choice == "p"
      puts "Let's play a round of battleship"
      #boat_sequence
    else
      puts "Please pick one of the three choices"
      puts "(p)lay, (i)nstructions or (q)uit"
      start_sequence
    end
  end

  def boat_sequence
    puts "where would you like your first boat to be placed?"
    user_input = gets.chomp
    if @current_board.idmap[user_input] != nil
      @current_board.board[@current_board.idmap[user_input]].boat_placement
    else
      boat_sequence
    end
  end

end
