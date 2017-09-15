# require 'faker'
# namespace :db do
#
#   task :ensure_development_environment => :environment do
#     if Rails.env.production?
#       raise "\nI'm sorry, I can't do that.\n(You're asking me to drop your production database.)"
#     end
#   end
#
#   desc 'inset fake contacts into db'
#   task populate: :environment do
#     # Avoid duplication so delete everything in from the DB
#     Rake::Task['db:setup'].invoke
#     # Rake::Task['db:drop:all'].invoke
#     # puts 'inserting a 1000 records...'
#
#     count = 0
#
#     10.times do
#       user = User.create!(username: Faker::Internet.user_name, email: Faker::Internet.email , password: 'batman', password_confirmation: 'batman')
#       question = user.questions.create!( title: Faker::Hipster.words(5).join(" ") + "?", body: Faker::Hipster.paragraph(10) )
#       5.times do
#         answer = Answer.new content: Faker::Lorem.words.join(" ") + "?" , question_id: question.id, user_id: user.id
#         answer.save!
#       end
#       count = count + 1
#     end
#
#     puts "inserted #{count} records"
#
#
#   end
#
#
# end
