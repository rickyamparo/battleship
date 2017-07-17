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
    first_ship_placement
  end

  def first_ship_placement
    first_spot = gets.chomp
    second_spot = gets.chomp
    if @current_board.idmap[first_spot] != nil
      @current_board.board[@current_board.idmap[first_spot]].boat_placement
    else
      puts "That is not an appropriate space"
      boat_sequence
    end
    if @current_board.idmap[second_spot] != nil
      @current_board.board[@current_board.idmap[second_spot]].boat_placement
    else
      puts "That is not an appropriate space"
      boat_sequence
    end
    if @current_board.idmap[first_spot] == @current_board.idmap[second_spot] + 1 ||
        @current_board.idmap[first_spot] == @current_board.idmap[second_spot] - 1 ||
          @current_board.idmap[first_spot] == @current_board.idmap[second_spot] -4 ||
            @current_board.idmap[first_spot] == @current_board.idmap[second_spot] +4
            puts "Those two spaces are valid, let's move on to your next ship"
    else
      puts "Those two spaces are not next to each other, please try again."
      boat_sequence
    end
  end

end
