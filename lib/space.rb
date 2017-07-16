require 'pry'

class Space

  attr_reader :occupied, :status

  def initialize
    @occupied = false
    @status = " "
  end

  def boat_placement
    if @occupied == false
      @occupied = true
    end
  end

  def space_hit
    if @status == " "
      @status = " "
    end
  end

end
