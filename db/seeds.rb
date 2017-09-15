require 'faker'

count = 0

10.times do
  user = User.create!(username: Faker::Internet.user_name, email: Faker::Internet.email , password: 'batman', password_confirmation: 'batman')
  question = user.questions.create!( title: Faker::Hipster.words(5).join(" ") + "?", body: Faker::Hipster.paragraph(10) )
  5.times do
    answer = Answer.new content: Faker::Lorem.words.join(" ") + "?" , question_id: question.id, user_id: user.id
    answer.save!
  end
  count = count + 1
end

puts "inserted #{count} records"
