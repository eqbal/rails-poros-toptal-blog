require 'spec_helper'

describe "Delete Entry" do
  	  
  it "Should delete entry using ajax", :js do       	  		  
    user  = create(:user)
    entry = create(:entry, user_id: user.id)

    sign_in_as_user(user)

    expect(page).to have_content('50.00 Km/H')
    click_link('X')
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_no_content(entry.distance)
  end   


end


def sign_in_as_user(user)
    visit "/users/sign_in"
    fill_in "Username", :with => user.username
    fill_in "Password", :with => user.password
    click_button "Sign in"
end
