require 'faker'

20.times do
  question = Question.new( title: Faker::Hipster.word, body: Faker::Lorem.characters(255))
  question.save!
end