require 'spec_helper'

describe "Entries" do
  describe "GET /entries" do
    
    let(:entry) { create(:entry) }
    let(:user)  { create(:user) }

    it "Can see the index page with no errors" do      
      sign_in_as_user(user)
      visit entries_path      
      expect(page).to have_content("entries")
    end

    context 'Signed in user' do      

      it "should see the entries he inserted already" do
        entry1 = create(:entry, user_id: user.id)  
        entry2 = create(:entry, user_id: user.id, distance: 10, time_period: 50)          
        entry4 = create(:entry, user_id: user.id, distance: 3223.0, time_period: 3223, distance_type: 1)

        sign_in_as_user(user)

        expect(page).to have_content('Signed in successfully.')

        expect(page).to have_content('50.00 Km/H')
        expect(page).to have_content('12.00 Km/H')
        expect(page).to have_content('60.00 Miles/H')
      end

      it "should contain date, distance, and time for each entry" do
        entry = create(:entry, user_id: user.id)
        sign_in_as_user(user)

        expect(page).to have_content(entry.date_time)
        expect(page).to have_content(entry.distance)
        expect(page).to have_content(entry.time_period)
      end
      
      it "should show average speed for each entry" do
        entry = create(:entry, user_id: user.id)
        entry2 = create(:entry, user_id: user.id, distance: 10, time_period: 50)

        sign_in_as_user(user)

        expect(page).to have_content('50.00 Km/H')
        expect(page).to have_content('12.00 Km/H')
      end      
    end

    context 'Not logged in user' do
      
      it "should not see entries and should be redirected to signup page" do
        visit entries_path
        expect(page).to have_content('You need to sign in or sign up before continuing.')
      end
    end
  end
end


def sign_in_as_user(user)
    visit "/users/sign_in"
    fill_in "Username", :with => user.username
    fill_in "Password", :with => user.password
    click_button "Sign in"
end
