require 'spec_helper'

describe "Show Entry" do

  before do
    user   = create(:user)
    @entry = create(:entry, user_id: user.id, distance: 17.8, time_period:36)
    sign_in_as_user(user)      
  end  
      

  it "Should delete entry using ajax", :js do                     
    click_link('Show')
    
    expect(page).to have_css('div.modal-dialog', :text == @entry.distance)
    expect(page).to have_css('div.modal-dialog', :text == @entry.time_period)
  end   

end


def sign_in_as_user(user)
    visit "/users/sign_in"
    fill_in "Username", :with => user.username
    fill_in "Password", :with => user.password
    click_button "Sign in"
end
