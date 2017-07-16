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

def test_battleship_can_decide_what_to_do
  bs = Battleship.new
  bs.decide_what_to_do
end

end
