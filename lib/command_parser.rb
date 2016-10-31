require "commands/place"
require "commands/move"
require "commands/left"
require "commands/right"
require "commands/report"

class CommandParser
  COMMAND_SEPERATOR = "\n"
  ARGUMENT_SEPERATOR = ","

  def self.parser(robot, commands)
    
      commands.split(COMMAND_SEPERATOR).map do |command|
        next if command.strip.empty?
        begin
          command_line = command.split(ARGUMENT_SEPERATOR).map(&:strip)
          command_name = command_line[0].capitalize
          command_args = command_line[1..-1]
          command_class_new = const_get("Commands::#{command_name}").method("new")
          command_args.empty? ? command_class_new.call(robot) : command_class_new.call(robot, command_args)
        rescue NameError => e
          raise Commands::Errors::UnknownCommand, "Unknow Command: #{command_name.upcase}"
        end
      end.compact
    
  end
end