DatabaseCleaner.clean_with(:truncation)
User.destroy_all
20.times do
    User.create(email: Faker::Internet.email, password:"qwerty123",password_confirmation: "qwerty123")
end
Vacancy.destroy_all
20.times do
    Vacancy.create(title: Faker::Job.title, salary: Faker::Number.decimal(2), responsibilities: Faker::Job.key_skill, demands: Faker::Job.key_skill, user_id: Faker::Number.between(1, 20))
end
Follow.destroy_all
40.times do
    Follow.create(followable_type: "User", followable_id: Faker::Number.between(1, 20), follower_type: "User", follower_id: Faker::Number.between(1, 20), blocked: false)
end

