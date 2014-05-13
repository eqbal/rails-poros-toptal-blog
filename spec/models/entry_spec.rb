require 'spec_helper'

describe Entry do

  let(:entry) { create(:entry) }
  

   it "should belong to user" do   	
     expect{entry.user}.not_to raise_error
   end

   describe "#distance" do

     it "should have a distance attribute" do
       expect(entry).to respond_to(:distance)
       expect(entry.distance).to be_kind_of(Float)
     end

     it "should only accept Numeric values for distance" do
       entry.distance = "string"
       expect(entry).not_to be_valid
       entry.distance = 1000
       expect(entry).to be_valid
     end

     it "should not accept empty/nil value" do
       entry.distance = nil
       expect(entry).not_to be_valid
     end     
   end

   describe "#time_period" do

     it "should have a time_period attribute" do
       expect(entry).to respond_to(:time_period)
       expect(entry.time_period).to be_kind_of(Integer)
     end
     
     it "should only accept Numeric values for time_period" do
       entry.time_period = "string"
       expect(entry).not_to be_valid
       entry.time_period = 1000
       expect(entry).to be_valid
     end

     it "should not accept empty/nil value" do
       entry.time_period = nil
       expect(entry).not_to be_valid
     end          
   end

   describe "#date_time" do
    
     it "should have a date_time attribute" do
       expect(entry).to respond_to(:date_time)
       expect(entry.date_time).to be_kind_of(String)
     end

     it "should not accept empty/nil value" do
       entry.date_time = nil
       expect(entry).not_to be_valid
     end          
   end


   describe "#avg_speed" do
    it "should return avg speed of 50 km/h for distance 100 km and time time_period 120 min" do
      entry.distance      = 100.0
      entry.distance_type = Entry::D_Type.invert['Km']
      entry.time_period   = 120
      expect(entry.avg_speed).to eq("50.00")
    end
   end

end
