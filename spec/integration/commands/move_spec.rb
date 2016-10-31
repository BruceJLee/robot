require "table_top"
require "robot"
require "commands/move"

describe Commands::Move do
  
  let(:table_top) { TableTop.new(5, 5) }
  let(:robot) { Robot.new(table_top) }
  let(:move) { Commands::Move.new(robot) }

  before { robot.place([3, 3, "NORTH"]) }

  describe ".execute" do
    before { move.execute }
    it "should move position of robot" do
      expect(robot.position.get_value).to eql([3, 4, "NORTH"])
    end
  end

  context "position of robot is not available" do
    before do
      robot.place([5, 4, "NORTH"])
      move.execute
    end
    it { expect(robot.position.get_value).to eql(nil) }
  end
end