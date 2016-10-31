require 'table_top'

describe TableTop do
  
  let(:table_top) { TableTop.new(5, 5) }
  
  describe ".end_of_x" do
    
    it "should return end_of_x of table top" do
      expect(table_top.end_of_x).to eql(4)
    end

  end

  describe ".end_of_y" do
    
    it "should return end_of_y of table top" do
      expect(table_top.end_of_y).to eql(4)
    end

  end

  describe ".validate" do

    context "when coordinate is in range of table top" do
      it { expect(table_top.validate(4,4)).to eql(true) }
    end

    context "when coordinate is not in range of table top" do

      context "when coordinate is over with positive value" do
        it { expect(table_top.validate(5,4)).to eql(false) }
      end

      context "when coordinate is over with negative value" do
        it { expect(table_top.validate(-1,0)).to eql(false) }
      end

    end

  end
end