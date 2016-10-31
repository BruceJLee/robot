require "commands/command"

module Commands
  class Place < Command

    def initialize(obj, args=nil)
      if args.nil?
        raise Commands::Errors::RequireArguments, "PLACE command requires args (eg. 3, 4, 'NORTH')"
      else
        super(obj, args)
      end
    end

    def execute
      @obj.place(@args)
    end

  end
end