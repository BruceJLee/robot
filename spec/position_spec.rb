require 'position'

describe Position do

  let(:position) { Position.new(table_top) }
  let(:valid_coordinate) { Coordinate.new(3, 4) }
  let(:invalid_coordinate) { Coordinate.new(6, 5) }
  let(:falling_coordinate) { Coordinate.new(0, 2) }
  let(:facing) { Facing.new("NORTH") }
  let(:falling_facing) { Facing.new("WEST") }
  let(:table_top) { TableTop.new(5, 5) }

  describe ".place" do
    
    context "before placing position" do
      it { expect(position.value).to eql(nil) }
    end

    context "after placing valid position" do
      before { position.place(valid_coordinate, facing) }
      it { expect(position.value).to eql([3, 4, "NORTH"]) }
      it { expect(position.coordinate).to eql(valid_coordinate) }
      it { expect(position.facing).to eql(facing) }
    end

    context "after placing invalid position" do
      before { position.place(invalid_coordinate, facing) }
      it { expect(position.value).to eql(nil) }
      it { expect(position.coordinate).to eql(nil) }
      it { expect(position.facing).to eql(nil) }
    end

  end

  describe ".move" do
    context "move to valid position and update position value" do
      before do
        position.place(valid_coordinate, facing)
        position.move
      end
      it {expect(position.value).to eql([3, 5, "NORTH"])}
    end

    context "ignore to update position value due to falling" do
      before do
        position.place(falling_coordinate, falling_facing)
        position.move
      end
      it { expect(position.value).to eql([0, 2, "WEST"])}
    end
  end

  describe ".turn" do

    context "turn right" do
      before do
        position.place(valid_coordinate, facing)
        position.turn("LEFT")
      end
      it { expect(position.value).to eql([3, 4, "WEST"]) }
    end

    context "turn left" do
      before do
        position.place(valid_coordinate, facing)
        position.turn("RIGHT")
      end
      it { expect(position.value).to eql([3, 4, "EAST"]) }
    end
  end
end