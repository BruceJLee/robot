require 'table_top'
require 'robot'
require 'simulator'

describe Simulator do

  let(:table_top) { TableTop.new(5, 5) }
  let(:robot) { Robot.new(table_top) }
  let(:simulator) { Simulator.new(robot) }
  
  let(:normal_command) {%{
    PLACE, 3, 3, NORTH
    MOVE
    LEFT
    MOVE
    LEFT
    MOVE
    REPORT
  }}

  let(:wrong_placing) {%{
    PLACE, 5, 6, NORTH
    LEFT
    MOVE
    MOVE
    RIGHT
    REPORT
  }}

  let(:falling_move) {%{
    PLACE, 1, 3, WEST
    MOVE
    MOVE
    MOVE
    RIGHT
    MOVE
    REPORT
  }}

  let(:wrong_placing_and_correct_placing) {%{
    PLACE, 7, 6, WEST
    MOVE
    RIGHT
    MOVE
    PLACE, 3, 3, NORTH
    MOVE
    RIGHT
    MOVE
    REPORT
  }}

  describe ".execute_commands" do
    context "execute normal command" do
      it { expect { simulator.execute_commands(normal_command) }.to output("2, 3, SOUTH\n").to_stdout }
    end

    context "execute command with wrong placing" do
      it { expect { simulator.execute_commands(wrong_placing) }.to_not output.to_stdout }
    end

    context "execute command with falling move" do
      it { expect { simulator.execute_commands(falling_move) }.to output("0, 4, NORTH\n").to_stdout }
    end

    context "execute command with wrong placing and correct placing" do
      it { expect { simulator.execute_commands(wrong_placing_and_correct_placing) }.to output("4, 4, EAST\n").to_stdout }
    end
  end
end