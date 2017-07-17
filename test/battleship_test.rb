require 'pry'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/Battleship'

class Battleship_Test < Minitest::Test

def test_battleship_exists
  bs = Battleship.new
  assert_instance_of Battleship, bs
end

def test_battleship_can_start_sequence
  bs = Battleship.new
  bs.start_sequence
end

def test_battleship_can_initiate_boat_sequence
  bs = Battleship.new
  bs.boat_sequence
end
