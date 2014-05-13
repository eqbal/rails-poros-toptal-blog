require "spec_helper"

describe "Make sure the User model track activities like last logged in" do
  
  let(:user) { create(:user) }

  it "current and last sign in timestamps are updated on each sign in" do
    expect(user.current_sign_in_at).to be_nil
    expect(user.last_sign_in_at).to be_nil

    sign_in_as_user(user)
    user.reload

    expect(user.current_sign_in_at).to be_kind_of(Time)
    expect(user.last_sign_in_at).to be_kind_of(Time)

    expect(user.current_sign_in_at).to eq(user.last_sign_in_at)
    expect(user.current_sign_in_at).to be >= user.created_at    
    
  end

  it "current and last sign in remote ip are updated on each sign in" do
    expect(user.current_sign_in_ip).to be_nil
    expect(user.last_sign_in_ip).to be_nil

    sign_in_as_user(user)
    user.reload

    expect(user.current_sign_in_ip).to eq("127.0.0.1")
    expect(user.last_sign_in_ip).to eq("127.0.0.1")
  end


  it "increase sign in count" do
    expect(user.sign_in_count).to eq(0)        

    sign_in_as_user(user)
    user.reload
    expect(user.sign_in_count).to eq(1)    
  end

end



def sign_in_as_user(user)
    visit "/users/sign_in"
    fill_in "Username", :with => user.username
    fill_in "Password", :with => user.password
    
    click_button "Sign in"
end