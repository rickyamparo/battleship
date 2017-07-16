require 'pry'
require './lib/space'

class Gameboard

  attr_reader :row_a, :row_b, :row_c, :row_d

  def initialize
    @row_a = [Space.new, Space.new, Space.new, Space.new]
    @row_b = [Space.new, Space.new, Space.new, Space.new]
    @row_c = [Space.new, Space.new, Space.new, Space.new]
    @row_d = [Space.new, Space.new, Space.new, Space.new]
  end

  def print_whole_board
    current_board = ""
    current_board += "\n" + print_row_a
    current_board += "\n" + print_row_b
    current_board += "\n" + print_row_c
    current_board += "\n" + print_row_d + "\n" + "\n"
    print current_board
  end

  def print_row_a
    current_row = ""
    @row_a.each do |space|
      current_row += space.status
    end
    current_row
  end

  def print_row_b
    current_row = ""
    @row_b.each do |space|
      current_row += space.status
    end
    current_row
  end

  def print_row_c
    current_row = ""
    @row_c.each do |space|
      current_row += space.status
    end
    current_row
  end

  def print_row_d
    current_row = ""
    @row_d.each do |space|
      current_row += space.status
    end
    current_row
  end


end
