require 'pry'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/gameboard_printer'

class Gameboard_printer_test < Minitest::Test

def test_it_can_print_row_a
  gb = GameboardPrinter.new
  assert_equal "    ", gb.print_row_a
end

end
