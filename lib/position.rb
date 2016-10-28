class Position
  attr :value, :coordinate, :facing
  attr_accessor :table_top

  def initialize(table_top)
    @table_top = table_top
    @coordinate = Coordinate.new(@table_top)
    @facing = Facing.new()
    @value = nil
  end

  def place(x, y, facing_point)
    @coordinate.update(x, y)
    @facing.point = facing_point

    if @coordinate.valid
      @value = [@coordinate.x, @coordinate.y, @facing.point]
    else
      @value = nil
    end
  end

  def move
    if @coordinate.move(@facing.point) == :success
      @value = [@coordinate.x, @coordinate.y, @facing.point]
    end
  end

  def turn(direction)
    return unless @coordinate.valid
    if direction == "LEFT"
      @facing.turn_left
    else
      @facing.turn_right
    end
    @value = [@coordinate.x, @coordinate.y, @facing.point]
  end
end