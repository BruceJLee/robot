require 'command'

describe Command do  
  
  let(:position_command) { Command.new(["PLACE", 3, 4, "NORTH"])}
  let(:action_command) { Command.new(["REPORT"])}

  describe ".type" do
    it "should return type of command" do
      expect(position_command.type).to eql("position")
      expect(action_command.type).to eql("action")
    end
  end

  describe ".event" do
    it "should return event of command" do
      expect(position_command.event).to eql("place")
    end
  end

  describe ".args" do
    context "command without args" do
      let(:command_without_args) { Command.new(["move"]) }
      it { expect(command_without_args.args).to eql(nil) }
    end

    context "command with args" do
      let(:command_with_args) { Command.new(["PLACE", 3, 4, "NORTH"]) }
      it { expect(command_with_args.args).to eql([3, 4, "NORTH"]) }
    end
  end

  describe "raise error with invalid command" do
    it "should return UnknownCommand" do
      expect { Command.new(["jump"]) }.to raise_error(UnknownCommand)
    end
  end
end