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
    puts "Where would you like your first boat to be placed?"
    first_ship_placement
    puts "Where would you like your second boat to be placed?"
    second_ship_placement
  end

  def first_ship_placement
    puts "What's your first spot?"
    first_spot = gets.chomp
    puts "What's your last spot?"
    second_spot = gets.chomp
    first_spot_placement(first_spot)
    second_spot_placement(second_spot)
    first_validator(first_spot, second_spot)
  end

  def second_ship_placement
    puts "What's your first spot?"
    first_spot = gets.chomp
    puts "what's yur second spot?"
    second_spot = gets.chomp
    puts "what's your last spot?"
    third_spot = gets.chomp
    if @current_board.board[@current_board.idmap[first_spot]].occupied == false
      first_spot_placement(first_spot)
    else
      puts "That place is already occupied, let's try the second ship again"
      second_ship_placement
    end
    second_spot_placement(second_spot)
    first_validator(first_spot, second_spot)
    third_spot_placement(third_spot)
    first_validator(second_spot, third_spot)
  end

  def first_spot_placement(first_spot)
    if @current_board.idmap[first_spot] != nil
      @current_board.board[@current_board.idmap[first_spot]].boat_placement
    else
      puts "That is not an appropriate space"
      first_spot_placement(first_spot)
    end
  end

  def second_spot_placement(second_spot)
    if @current_board.idmap[second_spot] != nil
      @current_board.board[@current_board.idmap[second_spot]].boat_placement
    else
      puts "That is not an appropriate space"
      second_spot_placement(second_spot)
    end
  end

  def third_spot_placement(third_spot)
    if @current_board.idmap[third_spot] != nil
      @current_board.board[@current_board.idmap[third_spot]].boat_placement
    else
      puts "That is not an appropriate space"
      third_spot_placement(third_spot)
    end
  end

  def first_validator(first_spot, second_spot)
    if @current_board.idmap[first_spot] == @current_board.idmap[second_spot] + 1 ||
        @current_board.idmap[first_spot] == @current_board.idmap[second_spot] - 1 ||
          @current_board.idmap[first_spot] == @current_board.idmap[second_spot] -4 ||
            @current_board.idmap[first_spot] == @current_board.idmap[second_spot] +4
    else
      puts "Those two spaces are not next to each other, please try again."
      first_ship_placement
    end
    puts "Those spaces are valid, let's move on."
  end



end
