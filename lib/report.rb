class Report
  attr :events

  def initialize
    @events = []
  end

  def record_event(event)
    @events << event
  end

  def print_latest_position_value
    position_value = @events.select { |event| event.type == "position" }.last.data
    print "#{position_value.join(", ")}\n"
    return :success
  end

end