require "command_parser"

class Simulator

  def initialize(robot)
    @robot = robot
  end

  def execute_commands(commands)
    CommandParser.parser(@robot, commands).each do |command|
      command.execute
    end
  end
  
end