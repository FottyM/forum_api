require 'faker'

count = 0
20.times do
  question = Question.create!( title: Faker::Hipster.word, body: Faker::Lorem.characters(255))
  @answer = Answer.new content: Faker::Lorem.words.join(",") , question_id: question.id
  # 5.times do

    @answer.save!
  # end
  count = count + 1
end

puts "inserted #{count} records"