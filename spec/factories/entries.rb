# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
    user_id 1
    distance 50
    time_period 60
    date_time  "2014-05-15 03:36:11 +0300"
    created_at "2014-05-15 01:54:40"
    updated_at "2014-05-15 01:54:40"
  end
end
