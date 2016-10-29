require 'event'

describe Event do
  
  let(:event) { Event.new("position", "place", :success, [3, 4, "NORTH"])}
  describe ".type" do
    it "should return event type" do
      expect(event.type).to eql("position")
    end
  end

  describe ".command" do
    it "should return event command" do
      expect(event.command).to eql("place")
    end
  end

  describe ".result" do
    it "should return event result" do
      expect(event.result).to eql(:success)
    end
  end

  describe ".state" do
    it "should return event data" do
      expect(event.data).to eql([3, 4, "NORTH"])
    end
  end
end