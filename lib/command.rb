class UnknownCommand < StandardError
end

class Command
  COMMAND_TYPES = {
    "place" => "position",
    "move" => "position",
    "left" => "position",
    "right" => "position",
    "report" => "action"
  }
  attr :type, :event, :args

  def initialize(command)
    @event = command[0].downcase
    @type = COMMAND_TYPES[@event]

    if @type.nil?
      raise UnknownCommand
    end
    
    @args = command[1..-1] unless command[1..-1].empty?
  end
end