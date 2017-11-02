DatabaseCleaner.clean_with(:truncation)

Industry.destroy_all

fields = ['Marketing', 'IT', 'Accounting', 'Administration', 'Advertising', 'Banking', 'Community-Services', 'Construction', 'Consulting', 'Design', 'Education', 'Farming', 'Government', 'Healthcare', 'Hospitality', 'Legal', 'Manufacturing', 'Marketing', 'Mining', 'Real-Estate', 'Retail', 'Sales', 'Technology']
fields.each { |i| Industry.create(name: i)}

User.destroy_all
User.create(
    email:"zshanabek@gmail.com", password:"123456789",password_confirmation:"123456789", 
    first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, 
    admission_date: Faker::Date.between(17.years.ago, Date.today), 
    graduation_date: Faker::Date.between(17.years.ago, Date.today),
    industry_id: Faker::Number.between(1, 21)
)
20.times do
    User.create(
        email: Faker::Internet.email, password:"123456789",password_confirmation: "123456789", 
        first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, 
        admission_date: Faker::Date.between(17.years.ago, Date.today),
        graduation_date: Faker::Date.between(17.years.ago, Date.today),
        industry_id: Faker::Number.between(1, 21)
    )
end
Vacancy.destroy_all
20.times do
    Vacancy.create(
        title: Faker::Job.title, salary: Faker::Number.decimal(2), 
        responsibilities: Faker::Job.key_skill, demands: Faker::Job.key_skill, 
        user_id: Faker::Number.between(1, 20)
    )
end
Follow.destroy_all
40.times do
    Follow.create(
        followable_type: "User", followable_id: Faker::Number.between(1, 20), 
        follower_type: "User", follower_id: Faker::Number.between(1, 20), 
        blocked: false
    )
end

