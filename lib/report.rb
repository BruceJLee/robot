class Report
  attr :events

  def initialize
    @events = []
  end

  def record_event(event)
    @events << event
  end

  def find_latest_position_value
    @events.select { |event| event.type == "position" }.last.data
  end

end