require 'pry'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/gameboard_printer'

class Gameboard_printer_test < Minitest::Test

def test_it_can_print_all_rows
  gb = GameboardPrinter.new
  assert_equal "    ", gb.print_row_a
  assert_equal "    ", gb.print_row_b
  assert_equal "    ", gb.print_row_c
  assert_equal "    ", gb.print_row_d
end

end
