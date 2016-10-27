require 'coordinate'

describe Coordinate do

  let(:coordinate) { Coordinate.new(3, 4) }

  describe ".x" do
    it "should return x coordinate" do
      expect(coordinate.x).to eql(3)
    end
  end

  describe ".y" do
    it "should return y coordinate" do
      expect(coordinate.y).to eql(4)
    end
  end

  describe ".x=" do
    before { coordinate.x = 2}
    it { expect(coordinate.x).to eql(2) }
  end

  describe ".y=" do
    before { coordinate.y = 3}
    it { expect(coordinate.y).to eql(3) }
  end

  describe ".move" do
    before(:each) do
      coordinate.x = 3
      coordinate.y = 4
    end

    context "move to north" do
      before { coordinate.move("NORTH") }
      it { expect(coordinate.x).to eql(3) }
      it { expect(coordinate.y).to eql(5) }
    end

    context "move to east" do
      before { coordinate.move("EAST") }
      it { expect(coordinate.x).to eql(4) }
      it { expect(coordinate.y).to eql(4) }
    end

    context "move to south" do
      before { coordinate.move("SOUTH") }
      it { expect(coordinate.x).to eql(3) }
      it { expect(coordinate.y).to eql(3) }
    end

    context "move to west" do
      before { coordinate.move("WEST") }
      it { expect(coordinate.x).to eql(2) }
      it { expect(coordinate.y).to eql(4) }
    end
  end
end