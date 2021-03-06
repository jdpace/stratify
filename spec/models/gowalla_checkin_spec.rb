require 'spec_helper'

SampleCheckinHash = {
  "type" => "checkin",
  "_photos_count" => 0,
  "message" => "True Grit",
  "item" => nil,
  "url" => "/checkins/26106798",
  "photo_thumbnail_urls" => [],
  "activity_url" => "/checkins/26106798/activity",
  "spot" => {
    "lat" => "35.9040261833",
    "lng" => "-78.7846096333",
    "image_url" => "http://static.gowalla.com/categories/30-c21e752b813cd8873603a18e06431675-100.png",
    "city_state" => "Raleigh, NC",
    "description" => "",
    "url" => "/spots/122718",
    "name" => "Regal Cinemas Brier Creek"
  },
  "created_at" => "2011-01-08T21:08:16Z",
  "_comments_count" => 0
}
  
describe GowallaCheckin do
  
  describe "building a GowallaCheckin from the hash returned by the Gowalla API" do
    before do
      @checkin = GowallaCheckin.new_from_api_hash Hashie::Mash.new(SampleCheckinHash)
    end

    it "sets the checkin ID" do
      @checkin.checkin_id.should == 26106798
    end
    
    it "sets the name of the checkin spot" do
      @checkin.spot_name.should == "Regal Cinemas Brier Creek"
    end

    it "sets the city and state of the checkin spot" do
      @checkin.spot_city_state.should == "Raleigh, NC"
    end

    it "sets the latitude of the checkin spot" do
      @checkin.spot_latitude.should == 35.9040261833
    end
    
    it "sets the longitude of the checkin spot" do
      @checkin.spot_longitude.should == -78.7846096333
    end
  end

  describe "#permalink" do
    it "returns the URL for this checkin on Gowalla" do
      checkin = GowallaCheckin.new(:checkin_id => 26106798)
      checkin.permalink.should == "http://gowalla.com/checkins/26106798"
    end
  end
  
end
