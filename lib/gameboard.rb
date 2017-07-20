require 'pry'
require './lib/space'

class Gameboard

  attr_reader :board, :idmap

  def initialize
    @board = [Space.new, Space.new, Space.new, Space.new,
              Space.new, Space.new, Space.new, Space.new,
              Space.new, Space.new, Space.new, Space.new,
              Space.new, Space.new, Space.new, Space.new]
    @idmap = {"A1" => 0,"A2" => 1,"A3" => 2,"A4" => 3,
              "B1" => 4,"B2" => 5,"B3" => 6,"B4" => 7,
              "C1" => 8,"C2" => 9,"C3" => 10,"C4" => 11,
              "D1" => 12,"D2" => 13,"D3" => 14,"D4" => 15}
  end

  def print_board
    board = ""
    board += ".   1    2    3    4  " + "\n"
    board += "A " + generate_row_a + "\n"
    board += "B " + generate_row_b + "\n"
    board += "C " + generate_row_c + "\n"
    board += "D " + generate_row_d + "\n"
    print board
  end

  def generate_row_a
    @board[0].status + @board[1].status + @board[2].status + @board[3].status
  end

  def generate_row_b
    @board[4].status + @board[5].status + @board[6].status + @board[7].status
  end

  def generate_row_c
    @board[8].status + @board[9].status + @board[10].status + @board[11].status
  end

  def generate_row_d
    @board[12].status + @board[13].status + @board[14].status + @board[15].status
  end

end
