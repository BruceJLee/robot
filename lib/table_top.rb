class TableTop
  ORIGIN = {x: 0, y: 0}
  attr :end_of_x, :end_of_y

  def initialize(x_units, y_units)
    @end_of_x = x_units - (ORIGIN[:x]+1)
    @end_of_y = y_units - (ORIGIN[:y]+1)
  end

  def validate(x, y)
    (x >= ORIGIN[:x] && x <= @end_of_x) &&
    (y >= ORIGIN[:y] && y <= @end_of_y)
  end
end