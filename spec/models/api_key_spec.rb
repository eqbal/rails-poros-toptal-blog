require 'spec_helper'

describe ApiKey do
  
  before(:each) do
    @user = create(:user)    
    @api_key = create(:api_key)
  end

  it "should belong to user" do     
    expect(@user.api_key).not_to be_nil   
  end

  it "should generate random token when we create one" do
    expect(@user.api_key.token).not_to be_nil
  end

  it "should generate random token when we create one" do       
    expect(@api_key.token).not_to be_nil
  end

  it "should have a user_id attribute" do
   expect(@api_key).to respond_to(:user_id)
   expect(@api_key.user_id).to be_kind_of(Integer)
  end

  it "should have a token attribute" do
   expect(@api_key).to respond_to(:token)
   expect(@api_key.token).to be_kind_of(String)
  end       

end
