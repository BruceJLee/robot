require "commands/command"

module Commands
  class Move < Command

    def initialize(obj, args=nil)
      if !args.nil?
        raise Commands::Errors::RequireNoArgument, "MOVE command does not require arguments"
      else
        super(obj, args)
      end
    end

    def execute
      @obj.move if valid?
    end

    def valid?
      @obj.is_available?
    end

  end
end