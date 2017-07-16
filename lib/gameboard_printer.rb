require 'pry'
require './lib/gameboard'

class GameboardPrinter

  def initialize
    @current_gameboard = Gameboard.new
  end

  def print_whole_board
    print print_row_a + "\n"
    print print_row_b + "\n"
    print print_row_c + "\n"
    print print_row_d + "\n"
  end

  def print_row_a
    current_row = ""
    @current_gameboard.row_a.each do |space|
      current_row += space.status
    end
    current_row
  end

  def print_row_b
    current_row = ""
    @current_gameboard.row_b.each do |space|
      current_row += space.status
    end
    current_row
  end

  def print_row_c
    current_row = ""
    @current_gameboard.row_c.each do |space|
      current_row += space.status
    end
    current_row
  end

  def print_row_d
    current_row = ""
    @current_gameboard.row_d.each do |space|
      current_row += space.status
    end
    current_row
  end

end
