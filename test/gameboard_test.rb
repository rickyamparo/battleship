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

  def test_gameboard_has_rows
    gb = Gameboard.new
    assert_instance_of Array, gb.row_a
    assert_instance_of Array, gb.row_b
    assert_instance_of Array, gb.row_c
    assert_instance_of Array, gb.row_d
  end

  def test_gameboard_can_create_rows
    gb = Gameboard.new
    gb.generate_rows
    assert_instance_of Array, gb.row_a
    assert_instance_of Array, gb.row_b
    assert_instance_of Array, gb.row_c
    assert_instance_of Array, gb.row_d
  end

  def test_gameboard_rows_are_made_of_spaces
    gb = Gameboard.new
    gb.generate_rows
    assert_instance_of Space, gb.row_a[0]
    assert_instance_of Space, gb.row_a[1]
    assert_instance_of Space, gb.row_a[2]
    assert_instance_of Space, gb.row_a[3]
  end

end
