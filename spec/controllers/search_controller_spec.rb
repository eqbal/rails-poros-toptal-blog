require 'spec_helper'

describe SearchController do
  
  let(:valid_attributes) { { 
    "user_id"     => "1", 
    "distance"    => 100,
    "time_period" => 100,    
    "date_time"   => "2014-05-15 03:36:11 +0300"
    } 
  }

  let(:valid_session) { {} }

  before (:each) do
    @user = create(:admin)
  end 

  describe "GET 'index'" do
    context 'loggedin user' do
    
      it "returns http success" do
        sign_in @user
        get 'index'
        response.should be_success
      end
        
    end

    context 'signed out user' do
      it "should not returns http success" do        
        get 'index'
        expect(response).not_to be_success
      end      
    end
  end

end



