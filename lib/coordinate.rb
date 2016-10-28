class Coordinate
  MOVE_X = {"EAST" => 1, "WEST" => -1}
  MOVE_Y = {"NORTH" => 1, "SOUTH" => -1}
  attr :x, :y, :valid
  attr_accessor :table_top

  def initialize(table_top)
    @table_top = table_top
    @valid = false
  end

  def update(x, y)
    if table_top.validate(x, y)
      @x, @y = x, y
      @valid = true
    else
      @x, @y = nil, nil
      @valid = false
    end
  end

  def move(facing_point)
    return :ignore unless @valid

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