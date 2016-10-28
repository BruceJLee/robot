class CommandParser
  COMMAND_SEPERATOR = "\n"
  ARGUMENT_SEPERATOR = ","

  def self.parser(commands)
    commands.split(COMMAND_SEPERATOR).map do |command|
      next if command.strip.empty?
      Command.new(command.split(ARGUMENT_SEPERATOR).map(&:strip))
    end.compact
  end
end