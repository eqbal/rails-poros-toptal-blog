require 'spec_helper'

describe "Report Page" do
       	
  let(:user)   { create(:user) }
  
  it "Should be able to check the page if the user logged in" do
    sign_in_as_user user
    visit statistics_entries_path    
    expect(current_path).to eq(statistics_entries_path)
  end  	  

  it "Should not be able to access the page if he the user signed out" do
    visit statistics_entries_path
    expect(page.status_code).to be(200)    
    expect(current_path).not_to eq(statistics_entries_path)
  end

  it "Should group entries by weeks (within one week group)" do
    # Three entries at the same first week of January 
    create_entries_groups_1

    sign_in_as_user user
    visit statistics_entries_path
    
    expect(page).to have_selector('table tr', :count => 2)    
    
    find('tr:last').text.should include('00')         # week number
    find('tr:last').text.should include("January 1")  # from date
    find('tr:last').text.should include("January 8")  # to date
    find('tr:last').text.should include('3')          # number of entries   
    find('tr:last').text.should include('6.0')        # avg distance
    find('tr:last').text.should include('8.0')        # avg speed
    
  end


  it "Should group entries by weeks (within two weeks groups)" do
    create_entries_groups_1
    create_entries_groups_2

    sign_in_as_user user
    visit statistics_entries_path
    
    expect(page).to have_selector('table tr', :count => 3)   
    
    find('tr:last').text.should include('51')         # week number
    find('tr:last').text.should include("December 23")  # from date
    find('tr:last').text.should include("December 30")  # to date
    find('tr:last').text.should include('3')          # number of entries   
    find('tr:last').text.should include('5.0')        # avg distance
    find('tr:last').text.should include('6.0')        # avg speed    
  end


  it "Should return grouped entries by KM when the distance given in Miles" do
    create_entries_groups_3
    sign_in_as_user user
    visit statistics_entries_path

    find('tr:last').text.should include('8.0')        # avg distance in KM
    find('tr:last').text.should include('8.0')        # avg speed   

  end

  it "Should not show other users entries" do
    new_user = create(:admin)
    create(:entry, user_id: new_user.id, date_time: "01/01/2014 4:44 PM", time_period: 50, distance: 5)

    sign_in_as_user user
    visit statistics_entries_path
    expect(page).to have_selector('table tr', :count => 1)   

  end

end

def sign_in_as_user(user)
    visit "/users/sign_in"
    fill_in "Username", :with => user.username
    fill_in "Password", :with => user.password
    click_button "Sign in"
end

def create_entries_groups_1
    create(:entry, user_id: user.id, date_time: "01/01/2014 4:44 PM", time_period: 50, distance: 5)
    create(:entry, user_id: user.id, date_time: '01/02/2014 4:44 PM', time_period: 30, distance: 5)
    create(:entry, user_id: user.id, date_time: '01/03/2014 4:44 PM', time_period: 60, distance: 8)
end

def create_entries_groups_2
    create(:entry, user_id: user.id, date_time: "12/24/2014 4:44 PM", time_period: 50, distance: 5)
    create(:entry, user_id: user.id, date_time: '12/25/2014 4:44 PM', time_period: 50, distance: 5)
    create(:entry, user_id: user.id, date_time: '12/26/2014 4:44 PM', time_period: 50, distance: 5)
end

def create_entries_groups_3
    create(:entry, user_id: user.id, date_time: "12/24/2014 4:44 PM", time_period: 60, distance: 5, distance_type: 1)
    create(:entry, user_id: user.id, date_time: '12/25/2014 4:44 PM', time_period: 60, distance: 5, distance_type: 1)
    create(:entry, user_id: user.id, date_time: '12/26/2014 4:44 PM', time_period: 60, distance: 5, distance_type: 1)
end