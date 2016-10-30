require 'position'
require 'report'
require 'event'
require 'command_parser'

class Robot

  def initialize(table_top)
    @position = Position.new(table_top)
    @report = Report.new()
  end

  def execute_commands(commands)
    CommandParser.parser(commands).each do |command|    
      if command.type == "position"
        if command.event == "place"
          result = place(command.args)
        else
          next unless @position.is_available?
          result = self.send(command.event)
        end
        record_position_event(command.event, result)
      elsif command.type == "action"
        next unless @position.is_available?
        result = self.send(command.event)
        record_action_event(command.event, result)
      end
    end
  end

  private

  def record_position_event(event, result)
    @report.record_event(Event.new("position", event, result, @position.get_value))
  end

  def record_action_event(event, result)
    @report.record_event(Event.new("action", event, result, nil))
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

  def report
    position_value = @report.find_latest_position_value
    print(position_value.join(", ") + "\n")
    return :success
  end
end