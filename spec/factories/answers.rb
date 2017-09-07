FactoryGirl.define do
  factory :answer do
    content { Faker::Hipster.paragraph }
    association :question
  end
end
