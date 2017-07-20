require 'pry'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/space'
require './lib/gameboard'

class Gameboard_test < Minitest::Test

  def test_gameboard_exists
    assert_instance_of Gameboard, Gameboard.new
  end

  def test_gameboard_are_made_of_spaces
    gb = Gameboard.new
    assert_instance_of Space, gb.board[0]
    assert_instance_of Space, gb.board[1]
    assert_instance_of Space, gb.board[2]
    assert_instance_of Space, gb.board[3]
  end

  def test_it_can_print_each_rows
    gb = Gameboard.new
    assert_equal " [ ]  [ ]  [ ]  [ ] ", gb.generate_row_a
    assert_equal " [ ]  [ ]  [ ]  [ ] ", gb.generate_row_b
    assert_equal " [ ]  [ ]  [ ]  [ ] ", gb.generate_row_c
    assert_equal " [ ]  [ ]  [ ]  [ ] ", gb.generate_row_d
  end

  def test_gameboard_can_print_whole_board
    skip
    gb = Gameboard.new
    assert_equal "", gb.print_board
  end

end
