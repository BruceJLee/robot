require 'robot'
require 'table_top'

describe Robot do
  
  let(:table_top) { TableTop.new(5, 5) }
  let(:robot) { Robot.new(table_top) }

  before(:each) do
    robot.place([3, 2, "SOUTH"])
  end

  describe ".place" do
    let(:position) { [3, 2, "SOUTH"] }

    it "should update position value" do
      expect(robot.position.get_value).to eql(position)
    end
  end

  describe ".move" do
    let(:position) { [3, 2, "SOUTH"] }
    before { robot.move }

    it "should move position value" do
      expect(robot.position.get_value).to eql([3, 1, "SOUTH"])
    end
  end

  describe ".left" do
    let(:position) { [3, 2, "SOUTH"] }
    before { robot.left }

    it "should turn left position value" do
      expect(robot.position.get_value).to eql([3, 2, "EAST"])
    end
  end

  describe ".right" do
    let(:position) { [3, 2, "SOUTH"] }
    before { robot.right }

    it "should turn right position value" do
      expect(robot.position.get_value).to eql([3, 2, "WEST"])
    end
  end

  describe ".show_current_position" do
    let(:position) { [3, 2, "SOUTH"] }
    before { robot.right }

    it "should print right position value" do
      expect { robot.show_current_position }.to output("3, 2, WEST\n").to_stdout
    end
  end

  describe ".is_available?" do
    context "position is not available" do
      before { robot.place([5, 5, "SOUTH"]) }
      it { expect(robot.is_available?).to eql(false) }
    end

    context "position is available" do
      before { robot.place([3, 2, "SOUTH"]) }
      it { expect(robot.is_available?).to eql(true) }
    end
  end
end