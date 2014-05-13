require 'spec_helper'

describe "RESTful API" do

  describe "Deleting an Entry" do
      let(:entry) { create(:entry) }
      let(:admin) { create(:admin) }
      let(:accept_json) { { "Accept" => "application/json" } }

      it "deletes an entry" do

        delete "/api/v1/entries/#{entry.id}", {token: admin.api_key.token} , accept_json

        expect(response.status).to be 200
        expect(Entry.all.count).to eq 0
      end

  end

end
