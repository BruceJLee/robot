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

end