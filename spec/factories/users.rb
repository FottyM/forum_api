FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password 'john3:36'
    password_confirmation 'john3:36'
    admin false
  end
end
