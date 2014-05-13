require "spec_helper"

describe "user registration" do
  it "allows new users to register with an email address and password" do
    visit "/users/sign_up"

  fill_in "Username",              :with => "eqbal"
    fill_in "Email",                 :with => "eqbal@example.com"
    fill_in "Password",              :with => "ilovegrapes"
    fill_in "Password confirmation", :with => "ilovegrapes"

    click_button "Sign up"    

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end