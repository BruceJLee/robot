class Coordinate
  MOVE_X = {"EAST" => 1, "WEST" => -1}
  MOVE_Y = {"NORTH" => 1, "SOUTH" => -1}
  attr_accessor :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def move(facing_point)
    @x = @x + MOVE_X[facing_point].to_i
    @y = @y + MOVE_Y[facing_point].to_i
  end
end