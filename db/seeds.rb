require 'faker'

count = 0

100.times do
  question = Question.create!( title: Faker::Hipster.words(5).join(" ") + "?", body: Faker::Hipster.paragraph(10) )
  5.times do
    answer = Answer.new content: Faker::Lorem.words.join(" ") + "?" , question_id: question.id
    answer.save!
  end
  count = count + 1
end

puts "inserted #{count} records"
