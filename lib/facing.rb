class Facing

  CARDINAL_POINTS = ["NORTH","EAST","SOUTH","WEST"]
  attr_accessor :point

  def initialize(point)
    @point = point
  end

  def turn_left
    @point = CARDINAL_POINTS[CARDINAL_POINTS.index(@point)-1]
  end

  def turn_right
    if @point == CARDINAL_POINTS.last
      @point = CARDINAL_POINTS[0]
    else
      @point = CARDINAL_POINTS[CARDINAL_POINTS.index(@point)+1]
    end
  end
end
