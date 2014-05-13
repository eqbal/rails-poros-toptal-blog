require "spec_helper"

describe "user sign in" do
  
  before(:each) do
     user = create(:admin)
  end

  it "allows users to sign in after they have registered" do        
  

    visit "/users/sign_in"

    fill_in "Username", :with => "admin"
    fill_in "Password", :with => "1234"

    click_button "Sign in"
    expect(page).to have_content("Signed in successfully.")
  end
end