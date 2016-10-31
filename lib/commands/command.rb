module Commands
  
  module Errors
    class NotImplementedError < StandardError
    end
    class UnknownCommand < StandardError
    end
    class RequireArguments < StandardError
    end
    class RequireNoArgument < StandardError
    end
  end

  class Command

    def initialize(obj, args=nil)
      @obj = obj
      @args = args
    end

    def execute
      raise Errors::NotImplementedError
    end
  end
end