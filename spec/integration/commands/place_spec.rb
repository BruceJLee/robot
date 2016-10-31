require "robot"
require "table_top"
require 'commands/place'

describe Commands::Place do
  let(:table_top) { TableTop.new(5, 5) }
  let(:robot) { Robot.new(table_top) }
  let(:place) { Commands::Place.new(robot, [3, 4, "NORTH"]) }

  describe ".execute" do
    before { place.execute }
    it "should update robot position value" do
      expect(robot.position.get_value).to eql([3, 4, "NORTH"])
    end
  end

  context "position of robot is not available" do
    let(:wrong_place) { Commands::Place.new(robot, [5, 4, "NORTH"]) }
    before do
      wrong_place.execute
    end
    it { expect(robot.position.get_value).to eql(nil) }
  end

end