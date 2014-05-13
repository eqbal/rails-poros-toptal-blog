require 'spec_helper'

describe "RESTful API" do

  describe "Showing an Entity" do

      it "returns a requested entity" do
        admin  = create(:admin) 
        entry = create(:entry)
        
        get "/api/v1/entries/#{entry.id}", {token: admin.api_key.token}    

        expect(response.status).to eq 200

        body = JSON.parse(response.body)
        
        expect(body["distance"]).to eq 50
      end  
  end

end


