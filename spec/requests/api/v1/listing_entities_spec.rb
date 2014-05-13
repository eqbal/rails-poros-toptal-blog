require 'spec_helper'

describe "RESTful API" do
  
  describe "Listing Entities" do

    context 'Without a valid Token' do
      it "Shouldn't show the entries for the user till he provide the token" do
        get api_v1_entries_path, :format => :json

        expect(response.header['Content-Type']).to include('application/json')      
        expect(my_json['message']).to eq('Invalid API Token') 
      end   
    end

    context 'With valid Token' do           
      
      before(:each) do          
        admin    = create(:admin)
        @entries = create_list(:entry, 10)          
        get api_v1_entries_path, {token: admin.api_key.token}             
      end

      it 'Shows a list of entries' do     
        expect(my_json['entries'].size).to eq(10)
        expect(my_json['total_count']).to eq(10)
      end

      it "Should show no entries when the user has no data" do        
        user = create(:user)
        get api_v1_entries_path, {token: user.api_key.token}
        expect(my_json['entries'].size).to eq(0)
        expect(my_json['total_count']).to eq(0)
      end

      it "Should show the needed attributes for entry" do
        entry = @entries.first
        
        json_entry = my_json['entries'].first
                
        expect(json_entry['id']).to eq(entry.id)
        expect(json_entry['distance']).to eq(entry.distance)
        expect(json_entry['time_period']).to eq(entry.time_period)
        expect(json_entry['date_time']).to eq(entry.date_time)
      end

    end
    
  end

end
