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

  def move
    @coordinate.move(@facing.point)

    if !@table_top.validate(@coordinate.x, @coordinate.y)
      @coordinate.x = @value[0]
      @coordinate.y = @value[1]
    end

    @value = [@coordinate.x, @coordinate.y, @facing.point]
  end

end