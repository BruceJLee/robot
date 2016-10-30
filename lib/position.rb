require 'coordinate'
require 'facing'

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
    if @coordinate.validate(x, y)
      @coordinate.update(x, y)
      @facing.point = facing_point
      @value = [@coordinate.x, @coordinate.y, @facing.point]
    else
      @value = nil
    end
  end

  def move
    result = @coordinate.move(@facing.point)

    if result == :success
      @value = [@coordinate.x, @coordinate.y, @facing.point]
    end

    return result
  end

  def turn(direction)

    if direction == "LEFT"
      @facing.turn_left
    else
      @facing.turn_right
    end

    @value = [@coordinate.x, @coordinate.y, @facing.point]
  end
end