class Position
  attr :value, :coordinate, :facing

  def initialize(table_top)
    @table_top = table_top
  end

  def place(coordinate, facing)
    if @table_top.validate(coordinate.x, coordinate.y)
      @coordinate = coordinate
      @facing = facing
      @value = [coordinate.x, coordinate.y, facing.point]
    else
      @coordinate = nil
      @facing = nil
      @value = nil
    end
  end

end