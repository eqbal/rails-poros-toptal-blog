require 'spec_helper'

describe "Delete Entry" do

  before do
    user   = create(:user)
    @entry = create(:entry, user_id: user.id, distance: 10.0, time_period:50)
    sign_in_as_user(user)      
  end  
      

  it "Should update the entity if the data is valid", :js do                     
    click_link('Edit')
    
    fill_in "distance-update", with: 5.0
    fill_in "timeperiod-update", with: 60

    click_on('Update Entry')

    expect(page).to have_content('5.0 Km')
    expect(page).to have_content('60')
    expect(page).to have_content('5.00 Km/H')
    expect(page).to have_content('less than a minute') # updated_at field
  end

  it "Should not update the entry and show error message when the data are invalid", :js do
    click_link('Edit')
    
    fill_in "distance-update", with: "string"
    fill_in "timeperiod-update", with: "string"

    click_on('Update Entry')

    expect(page).to have_content('Distance is not a number')
    expect(page).to have_content('Time period is not a number')         
  end     

end


def sign_in_as_user(user)
    visit "/users/sign_in"
    fill_in "Username", :with => user.username
    fill_in "Password", :with => user.password
    click_button "Sign in"
end






