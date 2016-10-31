require "commands/command"

module Commands
  class Report < Command

    def initialize(obj, args=nil)
      if !args.nil?
        raise Commands::Errors::RequireNoArgument, "REPORT command does not require arguments"
      else
        super(obj, args)
      end
    end

    def execute
      @obj.show_current_position if valid?
    end

    def valid?
      @obj.is_available?
    end
  end
end