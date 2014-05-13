require 'spec_helper'

describe "RESTful API" do

  describe "Searching" do
    it "should return the search results" do
        admin  = create(:admin) 
        
        for i in (10..25)
          create(:entry, date_time: "5/#{i}/2014")
        end
        
        get "/api/v1/entries/search", {token: admin.api_key.token,
                         from: '5/10/2014', 
                         to:   '5/15/2014'}

        expect(response.status).to eq 200

        body = JSON.parse(response.body)        
        
        expect(body["total_count"]).to eq 6
    end
  end
end