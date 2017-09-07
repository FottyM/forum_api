require 'faker'

FactoryGirl.define do
  factory :question do
    title { Faker::Hipster.word }
    body  { Faker::Hipster.paragraph }
  end
end
