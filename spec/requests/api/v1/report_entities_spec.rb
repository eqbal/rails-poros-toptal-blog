require 'spec_helper'

describe "RESTful API" do

  describe "Weekly Report" do
    it "should return the report for the user" do
        admin  = create(:admin) 
        
        for i in (10..25)
          create(:entry, date_time: "5/#{i}/2014")
        end
        
        get "/api/v1/entries/report", {token: admin.api_key.token}

        expect(response.status).to eq 200

        body = JSON.parse(response.body)        

        expect(body["total_count"]).to eq 3
        expect(body.to_s).to include "avg_distance"
        expect(body.to_s).to include "avg_speed"
        expect(body.to_s).to include "date_from"
    end 
  end

end