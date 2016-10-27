require 'facing'

describe Facing do
  
  let(:facing) { Facing.new("NORTH") }
  
  describe ".point" do
    
    it "should return facing point" do
      expect(facing.point).to eql("NORTH")
    end

  end

  describe ".point=" do
    
    before { facing.point = "EAST" }
    it { expect(facing.point).to eql("EAST") }
  
  end

  describe ".turn_left" do
    context "turn left from north" do
      before do
        facing.point = "NORTH"
        facing.turn_left
      end
      it { expect(facing.point).to eql("WEST") }
    end

    context "turn left from WEST" do
      before do
        facing.point = "WEST"
        facing.turn_left
      end
      it { expect(facing.point).to eql("SOUTH") }
    end

    context "turn left from south" do
      before do
        facing.point = "SOUTH"
        facing.turn_left
      end
      it { expect(facing.point).to eql("EAST") }
    end

    context "turn left from east" do
      before do
        facing.point = "EAST"
        facing.turn_left
      end
      it { expect(facing.point).to eql("NORTH") }
    end
  end

  describe ".turn_right" do
    context "turn right from north" do
      before do
        facing.point = "NORTH"
        facing.turn_right
      end
      it { expect(facing.point).to eql("EAST") }
    end

    context "turn right from east" do
      before do
        facing.point = "EAST"
        facing.turn_right
      end
      it { expect(facing.point).to eql("SOUTH") }
    end

    context "turn right from south" do
      before do
        facing.point = "SOUTH"
        facing.turn_right
      end
      it { expect(facing.point).to eql("WEST") }
    end

    context "turn right from west" do
      before do
        facing.point = "WEST"
        facing.turn_right
      end
      it { expect(facing.point).to eql("NORTH") }
    end
  end

end