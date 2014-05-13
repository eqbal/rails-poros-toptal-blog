require 'spec_helper'

describe "Search Page" do
       	
  let(:user)   { create(:user) }
  
  it "Should be able to check the page if the user logged in" do
    sign_in_as_user user
    visit search_index_path    
    expect(current_path).to eq(search_index_path)
  end  	  

  it "Should not be able to access the page if he the user signed out" do
    visit search_index_path
    expect(current_path).not_to eq(search_index_path)
  end

  it "Should show no results when no entries at the date range", :js do
    generate_entries
    sign_in_as_user user
    visit search_index_path    
    
    page.execute_script("$('#datetimepicker1').val('01/01/2014')")
    page.execute_script("$('#datetimepicker2').val('01/10/2014')")    
    click_button "Search"

    # Should show 9 results     
    expect(page).to have_selector('table tr', :count => 10)   


    page.execute_script("$('#datetimepicker1').val('01/01/2014')")
    page.execute_script("$('#datetimepicker2').val('01/29/2014')")    
    click_button "Search"

    # Should show 25 results     
    expect(page).to have_selector('table tr', :count => 26)   
  end

  it "Should be able to get search results if there are entries with the date range", :js do
    generate_entries
    sign_in_as_user user
    visit search_index_path    
    
    page.execute_script("$('#datetimepicker1').val('02/01/2014')")
    page.execute_script("$('#datetimepicker2').val('02/10/2014')")    

    click_button "Search"

    # Should show 9 results     
    expect(page).to have_selector('table tr', :count => 1)      
  end

  it "Should not be able to search other users Entries", :js do
    new_user = create(:admin)
    create(:entry, user_id: new_user.id, date_time: "01/05/2014 4:44 PM", time_period: 50, distance: 5)

    sign_in_as_user user
    visit search_index_path    

    page.execute_script("$('#datetimepicker1').val('01/01/2014')")
    page.execute_script("$('#datetimepicker2').val('01/10/2014')")    

    click_button "Search"

    expect(page).to have_content('No Entries Found')
  end  

end

def sign_in_as_user(user)
    visit "/users/sign_in"
    fill_in "Username", :with => user.username
    fill_in "Password", :with => user.password
    click_button "Sign in"
end

def generate_entries
    for i in (1..25) 
        n= (i < 10) ? "0#{i}" : i
        create(:entry, user_id: user.id, date_time: "01/#{n}/2014 4:44 PM", time_period: 50, distance: 5)
    end
end

def wait_for_ajax
  Timeout.timeout(Capybara.default_wait_time) do
    active = page.evaluate_script('jQuery.active')
    until active == 0
      active = page.evaluate_script('jQuery.active')
    end
  end
end