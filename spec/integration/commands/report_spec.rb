require "table_top"
require "robot"
require "commands/place"
require "commands/report"

describe Commands::Report do
  
  let(:table_top) { TableTop.new(5, 5) }
  let(:robot) { Robot.new(table_top) }
  let(:place) { Commands::Place.new(robot, [3, 4, "NORTH"])}
  let(:report) { Commands::Report.new(robot) }

  before { place.execute }

  describe ".execute" do
    it "should display position of robot" do
      expect { report.execute }.to output("3, 4, NORTH\n").to_stdout
    end
  end

  context "position of robot is not available" do
    before do
      robot.place([5, 4, "NORTH"])
    end
    it { expect { report.execute }.to_not output.to_stdout }
  end
end