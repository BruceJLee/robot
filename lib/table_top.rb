class TableTop
  attr :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def validate(x, y)
    (x >= 0 && x <= @width) &&
    (y >= 0 && y <= @height)
  end
end