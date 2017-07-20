require 'pry'
require './lib/gameboard'

class Player

  attr_reader :player_board

  def initialize
    @player_board = Gameboard.new
    ship_sequence
  end

  def ship_sequence
    puts "Where would you like your first ship's, first spot placed?"
    first_ship_placement
    puts "Where would you like your second ship's, first spot placed?"
    second_ship_placement
  end

  def first_ship_placement
    first_spot = gets.chomp
    puts "What's your first ship's last spot?"
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
    second_validator(first_spot, second_spot)
    second_validator(second_spot, third_spot)
    third_spot_validator(first_spot, third_spot)
    first_spot_placement(first_spot)
    second_spot_placement(second_spot)
    third_spot_placement(third_spot)
    puts "Those spaces are valid."
  end

  def first_spot_placement(first_spot)
    if @player_board.idmap[first_spot] != nil
      @player_board.board[@player_board.idmap[first_spot]].ship_placement
    else
      puts "That is not an appropriate space"
      first_spot_placement(first_spot)
    end
  end

  def second_spot_placement(second_spot)
    if @player_board.idmap[second_spot] != nil
      @player_board.board[@player_board.idmap[second_spot]].ship_placement
    else
      puts "That is not an appropriate space"
      second_spot_placement(second_spot)
    end
  end

  def third_spot_placement(third_spot)
    if @player_board.idmap[third_spot] != nil
      @player_board.board[@player_board.idmap[third_spot]].ship_placement
    else
      puts "That is not an appropriate space"
      third_spot_placement(third_spot)
    end
  end

  def first_validator(first_spot, second_spot)
    if (@player_board.idmap[first_spot] == @player_board.idmap[second_spot] + 1 ||
        @player_board.idmap[first_spot] == @player_board.idmap[second_spot] - 1 ||
          @player_board.idmap[first_spot] == @player_board.idmap[second_spot] - 4 ||
            @player_board.idmap[first_spot] == @player_board.idmap[second_spot] + 4)
    else
      puts "Those spaces are not valid, please try again."
      first_ship_placement
    end
    if @player_board.idmap[first_spot] % 4 == 3 && @player_board.idmap[second_spot] % 4 == 0 ||
      @player_board.idmap[second_spot] % 4 == 3 && @player_board.idmap[first_spot] % 4 == 0
      puts "Those spaces are not valid, please try again"
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
        puts "Those spaces are not valid, please try again."
        second_ship_placement
      end
      if (@player_board.idmap[first_spot] % 4 == 3 && @player_board.idmap[second_spot] % 4 == 0 ||
          @player_board.idmap[second_spot] % 4 == 3 && @player_board.idmap[first_spot] % 4 == 0)
          puts "Those spaces are not valid, please try again."
          second_ship_placement
      end
    else
      puts "Those spaces are not valid, please try again."
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
        puts "Those spaces are not valid, please try again."
        second_ship_placement
      end
      if (@player_board.idmap[first_spot] % 4 == 3 && @player_board.idmap[third_spot] % 4 == 1 ||
          @player_board.idmap[third_spot] % 4 == 0 && @player_board.idmap[first_spot] % 4 == 2)
          puts "Those spaces are not valid, please try again."
          second_ship_placement
      end
    else
      puts "Those spaces are not valid, please try again."
      second_ship_placement
    end
  end

end
