require 'table_top'
require 'robot'
require 'command_parser'
require 'commands/command'
require 'commands/place'
require 'commands/move'
require 'commands/left'

describe CommandParser do
  let(:table_top) { TableTop.new(5, 5) }
  let(:robot) { Robot.new(table_top) }
  let(:commands_text) {%{
    PLACE, 3, 4, NORTH
    MOVE
    LEFT
    RIGHT
    REPORT
  }}
  let(:unknown_commands_text) {%{
    FLY  
  }}
  let(:place_command_without_args) {%{
    PLACE  
  }}
  let(:move_command_with_args) {%{
    MOVE, 3, 4  
  }}
  let(:left_command_with_args) {%{
    LEFT, 3, 4  
  }}
  let(:right_command_with_args) {%{
    RIGHT, 3, 4  
  }}
  let(:report_command_with_args) {%{
    REPORT, 3, 4  
  }}
  let(:commands) {
    CommandParser.parser(robot, commands_text)
  }
  
  describe ".parser" do
    it "should return an array of command objects" do
      expect(commands[0].class).to eql(Commands::Place)
      expect(commands[1].class).to eql(Commands::Move)
      expect(commands[2].class).to eql(Commands::Left)
      expect(commands[3].class).to eql(Commands::Right)
      expect(commands[4].class).to eql(Commands::Report)
    end

    context "when parse Unknown command" do
      it { expect { CommandParser.parser(robot, unknown_commands_text) }.to raise_error(Commands::Errors::UnknownCommand) }
    end

    context "when place has no args" do
      it { expect { CommandParser.parser(robot, place_command_without_args) }.to raise_error(Commands::Errors::RequireArguments) }
    end

    context "when move has args" do
      it { expect { CommandParser.parser(robot, move_command_with_args) }.to raise_error(Commands::Errors::RequireNoArgument) }
    end

    context "when left has args" do
      it { expect { CommandParser.parser(robot, left_command_with_args) }.to raise_error(Commands::Errors::RequireNoArgument) }
    end

    context "when right has args" do
      it { expect { CommandParser.parser(robot, right_command_with_args) }.to raise_error(Commands::Errors::RequireNoArgument) }
    end

    context "when report has args" do
      it { expect { CommandParser.parser(robot, report_command_with_args) }.to raise_error(Commands::Errors::RequireNoArgument) }
    end
  end
end