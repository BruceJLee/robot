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
    new_x, new_y = get_front(facing_point.upcase)

    if table_top.validate(new_x, new_y)
      @x, @y = new_x, new_y
    end
  end

  private

  def get_front(facing_point)
    x = @x + MOVE_X[facing_point].to_i
    y = @y + MOVE_Y[facing_point].to_i
    return x, y
  end

end