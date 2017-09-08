require 'faker'

count = 0
20.times do
  question = Question.create!( title: Faker::Hipster.word, body: Faker::Lorem.characters(255))
  5.times do
    answer = Answer.new content: Faker::Lorem.words.join(" ") + "?" , question_id: question.id
    answer.save!
  end
  count = count + 1
end

puts "inserted #{count} records"