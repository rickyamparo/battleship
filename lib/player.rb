require 'pry'
require './lib/gameboard'

class Player

  attr_reader :player_board

  def initialize
    @player_board = Gameboard.new
    ship_sequence
  end

  def ship_sequence
    first_ship_placement
    second_ship_placement
  end

  def first_ship_placement
    puts "Where would you like your first ship's, first spot placed?"
    first_spot = input_validator
    puts "What's your first ship's last spot?"
    second_spot = input_validator
    first_validator(first_spot, second_spot)
    first_spot_placement(first_spot)
    second_spot_placement(second_spot)
  end

  def second_ship_placement
    puts "Where would you like your second ship's, first spot placed?"
    first_spot = input_validator
    puts "What's your second ship's second spot?"
    second_spot = input_validator
    puts "What's your second ship's last spot?"
    third_spot = input_validator
    second_validator(first_spot, second_spot)
    second_validator(second_spot, third_spot)
    third_spot_validator(first_spot, third_spot)
    first_spot_placement(first_spot)
    second_spot_placement(second_spot)
    third_spot_placement(third_spot)
    puts "Those spaces are valid."
  end

  def input_validator
    spot = gets.chomp
    while @player_board.idmap[spot] == nil
      puts "Please input a valid coordinate."
      spot = gets.chomp
    end
    spot
  end

  def first_spot_placement(first_spot)
    if @player_board.idmap[first_spot] != nil
      @player_board.board[@player_board.idmap[first_spot]].ship_placement
    else
      puts "That is not an appropriate space, please try again.1"
      first_ship_placement
    end
  end

  def second_spot_placement(second_spot)
    if @player_board.idmap[second_spot] != nil
      @player_board.board[@player_board.idmap[second_spot]].ship_placement
    else
      puts "That is not an appropriate space, please try again.2"
      first_ship_placement
    end
  end

  def third_spot_placement(third_spot)
    if @player_board.idmap[third_spot] != nil
      @player_board.board[@player_board.idmap[third_spot]].ship_placement
    else
      puts "That is not an appropriate space, please try again.3"
      second_ship_placement
    end
  end

  def first_validator(first_spot, second_spot)
    if (@player_board.idmap[first_spot] == @player_board.idmap[second_spot] + 1 ||
        @player_board.idmap[first_spot] == @player_board.idmap[second_spot] - 1 ||
          @player_board.idmap[first_spot] == @player_board.idmap[second_spot] - 4 ||
            @player_board.idmap[first_spot] == @player_board.idmap[second_spot] + 4)
    else
      puts "Those spaces are not valid, please try again.4"
      first_ship_placement
    end
    if @player_board.idmap[first_spot] % 4 == 3 && @player_board.idmap[second_spot] % 4 == 0 ||
      @player_board.idmap[second_spot] % 4 == 3 && @player_board.idmap[first_spot] % 4 == 0
      puts "Those spaces are not valid, please try again.5"
      first_ship_placement
    end
  end

  def second_validator(first_spot, second_spot)
    if (@player_board.board[@player_board.idmap[first_spot]].occupied == false)
      if (@player_board.idmap[first_spot] == @player_board.idmap[second_spot] + 1 ||
          @player_board.idmap[first_spot] == @player_board.idmap[second_spot] - 1 ||
            @player_board.idmap[first_spot] == @player_board.idmap[second_spot] - 4 ||
              @player_board.idmap[first_spot] == @player_board.idmap[second_spot] + 4)
      else
        puts "Those spaces are not valid, please try again. 7"
        second_ship_placement
      end
      if (@player_board.idmap[first_spot] % 4 == 3 && @player_board.idmap[second_spot] % 4 == 0 ||
          @player_board.idmap[second_spot] % 4 == 3 && @player_board.idmap[first_spot] % 4 == 0)
          puts "Those spaces are not valid, please try again. 8"
          second_ship_placement
      end
    else
      puts "Those spaces are not valid, please try again.9"
      second_ship_placement
    end
  end

  def third_spot_validator(first_spot, third_spot)
    if (@player_board.board[@player_board.idmap[first_spot]].occupied == false)
      if (@player_board.idmap[first_spot] == @player_board.idmap[third_spot] + 2 ||
          @player_board.idmap[first_spot] == @player_board.idmap[third_spot] - 2 ||
            @player_board.idmap[first_spot] == @player_board.idmap[third_spot] - 8 ||
              @player_board.idmap[first_spot] == @player_board.idmap[third_spot] + 8)
      else
        puts "Those spaces are not valid, please try again. 11"
        second_ship_placement
      end
      if (@player_board.idmap[first_spot] % 4 == 3 && @player_board.idmap[third_spot] % 4 == 1 ||
          @player_board.idmap[third_spot] % 4 == 0 && @player_board.idmap[first_spot] % 4 == 2)
          puts "Those spaces are not valid, please try again. 12"
          second_ship_placement
      end
    else
      puts "Those spaces are not valid, please try again. 13"
      second_ship_placement
    end
  end

end
