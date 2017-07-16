require 'pry'
require './lib/space'

class Gameboard

  attr_reader :row_a, :row_b, :row_c, :row_d

  def initialize
    @row_a = []
    @row_b = []
    @row_c = []
    @row_d = []
  end

  def generate_rows
    @row_a = [Space.new, Space.new, Space.new, Space.new]
    @row_b = [Space.new, Space.new, Space.new, Space.new]
    @row_c = [Space.new, Space.new, Space.new, Space.new]
    @row_d = [Space.new, Space.new, Space.new, Space.new] 
  end



end
