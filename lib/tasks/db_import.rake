require 'faker'
namespace :db do

  task :ensure_development_environment => :environment do
    if Rails.env.production?
      raise "\nI'm sorry, I can't do that.\n(You're asking me to drop your production database.)"
    end
  end

  desc 'inset fake contacts into db'
  task populate: :environment do
    # Avoid duplication so delete everything in from the DB
    # Rake::Task['db:setup'].invoke
    # puts 'inserting a 1000 records...'

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

  end


end
