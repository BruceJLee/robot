require "table_top"
require "robot"
require "commands/right"

describe Commands::Right do
  
  let(:table_top) { TableTop.new(5, 5) }
  let(:robot) { Robot.new(table_top) }
  let(:right) { Commands::Right.new(robot) }

  before { robot.place([3, 3, "NORTH"]) }

  describe ".execute" do
    before { right.execute }
    it "should turn right position of robot" do
      expect(robot.position.get_value).to eql([3, 3, "EAST"])
    end
  end

  context "position of robot is not available" do
    before do
      robot.place([5, 4, "NORTH"])
      right.execute
    end
    it { expect(robot.position.get_value).to eql(nil) }
  end
end