require 'table_top'

describe TableTop do
  
  let(:table_top) { TableTop.new(5, 5) }
  
  describe ".width" do
    
    it "should return width of table top" do
      expect(table_top.width).to eql(5)
    end

  end

  describe ".height" do
    
    it "should return height of table top" do
      expect(table_top.height).to eql(5)
    end

  end

  describe ".validate" do

    context "when coordinate is in range of table top" do
      it { expect(table_top.validate(4,4)).to eql(true) }
    end

    context "when coordinate is not in range of table top" do

      context "when coordinate is over with positive value" do
        it { expect(table_top.validate(6,5)).to eql(false) }
      end

      context "when coordinate is over with negative value" do
        it { expect(table_top.validate(-1,0)).to eql(false) }
      end

    end

  end
end