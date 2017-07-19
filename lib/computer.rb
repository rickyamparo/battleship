require 'pry'
require './lib/gameboard'

class Computer

attr_reader :computer_board

  def initialize
    @computer_board = Gameboard.new
    initiate_ships
  end

  def initiate_ships
    pattern_num = rand(1..5)
    if pattern_num == 1
      pattern_a
    elsif pattern_num == 2
      pattern_b
    elsif pattern_num == 3
      pattern_c
    elsif pattern_num == 4
      pattern_d
    elsif pattern_num == 5
      pattern_e
    end
  end

  def pattern_a
    @computer_board.board[0].ship_placement
    @computer_board.board[4].ship_placement
    @computer_board.board[5].ship_placement
    @computer_board.board[6].ship_placement
    @computer_board.board[7].ship_placement
  end

  def pattern_b
    @computer_board.board[10].ship_placement
    @computer_board.board[11].ship_placement
    @computer_board.board[1].ship_placement
    @computer_board.board[2].ship_placement
    @computer_board.board[3].ship_placement
  end

  def pattern_c
    @computer_board.board[8].ship_placement
    @computer_board.board[12].ship_placement
    @computer_board.board[3].ship_placement
    @computer_board.board[7].ship_placement
    @computer_board.board[11].ship_placement
  end

  def pattern_d
    @computer_board.board[9].ship_placement
    @computer_board.board[10].ship_placement
    @computer_board.board[7].ship_placement
    @computer_board.board[11].ship_placement
    @computer_board.board[15].ship_placement
  end

  def pattern_e
    @computer_board.board[5].ship_placement
    @computer_board.board[9].ship_placement
    @computer_board.board[0].ship_placement
    @computer_board.board[1].ship_placement
    @computer_board.board[2].ship_placement
  end

end
