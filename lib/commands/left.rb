require "commands/command"

module Commands
  class Left < Command
    
    def initialize(obj, args=nil)
      if !args.nil?
        raise Commands::Errors::RequireNoArgument, "LEFT command does not require arguments"
      else
        super(obj, args)
      end
    end

    def execute
      @obj.left if valid?
    end

    def valid?
      @obj.is_available?
    end

  end
end