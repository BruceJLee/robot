require 'position'
require 'command_parser'

class Robot

  attr :position

  def initialize(table_top)
    @position = Position.new(table_top)
  end

  def place(args)
    @position.place(args[0].to_i, args[1].to_i, args[2])
  end

  def move
    @position.move
  end

  def left
    @position.turn("LEFT")
  end

  def right
    @position.turn("RIGHT")
  end

  def show_current_position
    print "#{@position.get_value.join(", ")}\n"
  end

  def is_available?
    @position.is_available?
  end
end