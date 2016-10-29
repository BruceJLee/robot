require 'report'

describe Report do  
  let(:report) { Report.new() }
  let(:event1) { Event.new("position", "place", :success, [3, 4, "NORTH"]) }
  let(:event2) { Event.new("position", "move", :success, [3, 5, "NORTH"]) }

  describe ".record_event" do
    before { report.record_event(event1) }
    
    it "should store a event in events list" do
      expect(report.events).to eql([event1])
    end

  end

  describe ".find_latest_position_value" do
    before do
      report.record_event(event1)
      report.record_event(event2)
    end
    
    it "should return a position value from with latest event" do
      expect(report.find_latest_position_value).to eql([3, 5, "NORTH"])
    end
  end
end