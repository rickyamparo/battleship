require 'pry'
require './lib/gameboard'

class Player

  attr_reader :player_board

  def initialize
    @player_board = Gameboard.new
  end

  def boat_sequence
    puts "Where would you like your first boat's first spot placed?"
    first_ship_placement
    puts "Where would you like your second boat's first spot placed?"
    second_ship_placement
  end

  def first_ship_placement
    first_spot = gets.chomp
    puts "What's your first boat's last spot?"
    second_spot = gets.chomp
    first_spot_placement(first_spot)
    second_spot_placement(second_spot)
    first_validator(first_spot, second_spot)
  end

  def second_ship_placement
    first_spot = gets.chomp
    puts "what's your second spot?"
    second_spot = gets.chomp
    puts "what's your last spot?"
    third_spot = gets.chomp
    if @player_board.board[@player_board.idmap[first_spot]].occupied == false
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
    if @player_board.idmap[first_spot] != nil
      @player_board.board[@player_board.idmap[first_spot]].boat_placement
    else
      puts "That is not an appropriate space"
      first_spot_placement(first_spot)
    end
  end

  def second_spot_placement(second_spot)
    if @player_board.idmap[second_spot] != nil
      #if the value of the second_spot in the hash is not nil(has to be between 0-15)
      @player_board.board[@player_board.idmap[second_spot]].boat_placement
      #Check the space at location of the second_spot key
    else
      puts "That is not an appropriate space"
      second_spot_placement(second_spot)
      #start this whole process again, if it's not in the space then
    end
  end

  def third_spot_placement(third_spot)
    if @player_board.idmap[third_spot] != nil
      @player_board.board[@player_board.idmap[third_spot]].boat_placement
    else
      puts "That is not an appropriate space"
      third_spot_placement(third_spot)
    end
  end

  def first_validator(first_spot, second_spot)
    if (@player_board.idmap[first_spot] == @player_board.idmap[second_spot] + 1 ||
        @player_board.idmap[first_spot] == @player_board.idmap[second_spot] - 1 ||
          @player_board.idmap[first_spot] == @player_board.idmap[second_spot] - 4 ||
            @player_board.idmap[first_spot] == @player_board.idmap[second_spot] + 4) &&
              (@player_board.idmap[first_spot] % 4 == 3 && @player_board.idmap[second_spot] % 4 != 0 &&
                @player_board.idmap[second_spot] % 4 == 3 && @player_board.idmap[first_spot] % 4 != 0)
    else
      puts "Those spaces are not valid, please try again."
      first_ship_placement
    end
    puts "Those spaces are valid, let's move on."
  end

end
