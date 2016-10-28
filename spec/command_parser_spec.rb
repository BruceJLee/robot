require 'command_parser'

describe CommandParser do
  
  let(:commands_text) {%{
    PLACE, 3, 4, NORTH
    MOVE
    LEFT
  }}
  let(:commands) {
    CommandParser.parser(commands_text)
  }
  let(:commands_objects) {[
    Command.new(["PLACE", "3", "4", "NORTH"]),
    Command.new(["MOVE"]),
    Command.new(["LEFT"])
  ]}
  
  describe ".parser" do
    it "should return an array of command objects" do
      expect(commands[0].type).to eql("position")
      expect(commands[0].event).to eql("place")
      expect(commands[0].args).to eql(["3","4","NORTH"])
      expect(commands[1].type).to eql("position")
      expect(commands[1].event).to eql("move")
      expect(commands[1].args).to eql(nil)
      expect(commands[2].type).to eql("position")
      expect(commands[2].event).to eql("left")
      expect(commands[2].args).to eql(nil)
    end
  end
end