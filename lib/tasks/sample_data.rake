namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
    make_surveys
  end
end

def make_users
  admin = User.create!(name:     "Example User",
                       email:    "example@railstutorial.org",
                       password: "foobar",
                       password_confirmation: "foobar",
                       admin: true)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_microposts
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end

def make_surveys
  users = User.all(limit: 4)
  5.times do
    question = Faker::Lorem.sentence(6)
    option_a = Faker::Lorem.sentence(3)
    option_b = Faker::Lorem.sentence(3)
    option_c = Faker::Lorem.sentence(3)
    option_d = Faker::Lorem.sentence(3)
    users.each do |user| 
      user.surveys.create!(question: question, option_a: option_a,
                          option_b: option_b, option_c: option_c,
                          option_d: option_d, user_id: user.id)
    end
  end
end