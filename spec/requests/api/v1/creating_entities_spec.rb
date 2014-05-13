require 'spec_helper'

describe "RESTful API" do

  describe "Creating an Entity" do
      it "creates an entity" do
      admin  = create(:admin) 
    
        entry_params = {
          "entry" => {
            "distance" => 50.0,
            "time_period" => 40,
            "date_time" => '05/22/2014 6:20 AM'
          },
          token: admin.api_key.token          
        }.to_json

        request_headers = {
          "Accept" => "application/json",
          "Content-Type" => "application/json"          
        }

        post "/api/v1/entries", entry_params, request_headers

        expect(response.status).to eq 201 # created
        expect(Entry.last.distance).to eq(50.0)
      end   
  end

end
