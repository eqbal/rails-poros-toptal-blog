FactoryGirl.define do
  factory :user do
    username "username"
    email "eqbal@example.com"
    password "password"
    password_confirmation "password"    
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    username "admin"
    email "admin@example.com"
    password "1234"
    password_confirmation "1234"
    admin true
  end
end
