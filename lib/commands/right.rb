require "commands/command"

module Commands
  class Right < Command

    def initialize(obj, args=nil)
      if !args.nil?
        raise Commands::Errors::RequireNoArgument, "Right command does not require arguments"
      else
        super(obj, args)
      end
    end

    def execute
      @obj.right if valid?
    end

    def valid?
      @obj.is_available?
    end
  end
end