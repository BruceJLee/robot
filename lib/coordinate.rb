class Coordinate
  MOVE_X = {"EAST" => 1, "WEST" => -1}
  MOVE_Y = {"NORTH" => 1, "SOUTH" => -1}
  attr :x, :y, :valid
  attr_accessor :table_top

  def initialize(table_top)
    @table_top = table_top
  end

  def validate(x, y)
    @table_top.validate(x, y)
  end

  def update(x, y)
    @x, @y = x, y
  end

  def move(facing_point)

    new_x = @x + MOVE_X[facing_point].to_i
    new_y = @y + MOVE_Y[facing_point].to_i

    if table_top.validate(new_x, new_y)
      @x, @y = new_x, new_y
      return :success
    else
      return :ignore
    end
  end

end