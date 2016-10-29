require 'position'

describe Position do

  let(:table_top) { TableTop.new(5, 5) }
  let(:position) { Position.new(table_top) }

  describe ".place" do
    
    context "before placing position" do
      it { expect(position.value).to eql(nil) }
    end

    context "after placing valid position" do
      before { position.place(3, 4, "NORTH") }
      it { expect(position.value).to eql([3, 4, "NORTH"]) }
    end

    context "after placing invalid position" do
      before { position.place(6, 5, "NORTH") }
      it { expect(position.value).to eql(nil) }
    end

  end

  describe ".move" do

    context "move to valid position and update position value" do
      before do
        position.place(3, 3, "NORTH")
        @result = position.move
      end

      it { expect(@result).to eql(:success) }
      it {expect(position.value).to eql([3, 4, "NORTH"]) }
    end

    context "ignore to update position value due to falling" do
      before do
        position.place(0, 2, "WEST")
        @result = position.move
      end

      it { expect(@result).to eql(:ignore) }
      it { expect(position.value).to eql([0, 2, "WEST"]) }
    end

  end

  describe ".turn" do

    context "turn left" do
      before do
        position.place(3, 4, "NORTH")
        position.turn("LEFT")
      end

      it { expect(position.value).to eql([3, 4, "WEST"]) }
    end

    context "turn right" do
      before do
        position.place(3, 4, "NORTH")
        @result = position.turn("RIGHT")
      end

      it { expect(position.value).to eql([3, 4, "EAST"]) }
    end

  end
end