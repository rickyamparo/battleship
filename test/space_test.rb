require 'pry'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/space'

class Space_Test < Minitest::Test

  def test_space_exists
    assert_instance_of Space, Space.new
  end

  def test_occupance
    s = Space.new
    refute s.occupied
  end

def test_space_hit_status
    s = Space.new
    assert_equal " [ ] ", s.status
  end

def test_space_can_have_boat
  s = Space.new
  s.boat_placement
  assert s.occupied
end

def test_space_can_be_hit
  s = Space.new
  s.space_hit
  assert_equal " [M] ", s.status
  s.boat_placement
  s.space_hit
  assert_equal " [H] ", s.status
end



end
