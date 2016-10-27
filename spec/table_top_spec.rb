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

end