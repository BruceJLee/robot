require "table_top"
require "robot"
require "commands/left"

describe Commands::Left do
  
  let(:table_top) { TableTop.new(5, 5) }
  let(:robot) { Robot.new(table_top) }
  let(:left) { Commands::Left.new(robot) }

  before { robot.place([3, 3, "NORTH"]) }

  describe ".execute" do
    before { left.execute }
    it "should turn left position of robot" do
      expect(robot.position.get_value).to eql([3, 3, "WEST"])
    end

    context "position of robot is not available" do
      before do
        robot.place([5, 4, "NORTH"])
        left.execute
      end
      it { expect(robot.position.get_value).to eql(nil) }
    end
  end
end