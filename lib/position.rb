require 'coordinate'
require 'facing'

class Position
  attr :coordinate, :facing
  attr_accessor :table_top

  def initialize(table_top)
    @table_top = table_top
    @coordinate = Coordinate.new(@table_top)
    @facing = Facing.new()
    @available = false
  end

  def place(x, y, facing_point)
    if @coordinate.validate(x, y)
      @coordinate.update(x, y)
      @facing.point = facing_point
      @available = true
      return :success
    else
      @available = false
      return :fail
    end
  end

  def move
    @coordinate.move(@facing.point)
  end

  def turn(direction)

    if direction == "LEFT"
      @facing.turn_left
    else
      @facing.turn_right
    end

  end

  def get_value
    return nil unless @available
    [@coordinate.x, @coordinate.y, @facing.point]
  end

  def is_available?
    @available
  end
end