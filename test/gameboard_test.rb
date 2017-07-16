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

end
