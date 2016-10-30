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
      next if skip_command?(command.event)
      method = self.method("#{command.type}_#{command.event}")
      result = command.args.nil? ? method.call : method.call(command.args)
      self.send("record_#{command.type}_event", command.event, result)
    end
  end

  private

  def record_position_event(event, result)
    @report.record_event(Event.new("position", event, result, @position.get_value))
  end

  def record_action_event(event, result)
    @report.record_event(Event.new("action", event, result, nil))
  end

  def position_place(args)
    @position.place(args[0].to_i, args[1].to_i, args[2])
  end

  def position_move
    @position.move
  end

  def position_left
    @position.turn("LEFT")
  end

  def position_right
    @position.turn("RIGHT")
  end

  def action_report
    position_value = @report.find_latest_position_value
    print(position_value.join(", ") + "\n")
    return :success
  end

  def skip_command?(event)
    event != "place" && !@position.is_available?
  end
end