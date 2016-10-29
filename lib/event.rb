class Event
  attr :type, :command, :result, :data

  def initialize(type, command, result, data)
    @type = type
    @command = command
    @result = result
    @data = data
  end

end