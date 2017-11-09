DatabaseCleaner.clean_with(:truncation)


fields = ['Маркетинг', 'Информационные технологии', 'Бухгалтерский учёт', 'Администрация', 
          'Рекламное дело', 'Банкинг', 'Общественные услуги', 'Строительство', 'Консалтинг', 
          'Дизайн', 'Образование', 'Фермерское дело', 'Государственная служба', 'Здравохранение', 
          'Гостевое дело', 'Юриспруденция', 'Производство', 'Маркетинг', 'Mining', 'Real-Estate', 
          'Retail', 'Продажи', 'Технологии']
fields.each {
     |i| Industry.create(name: i)
}

User.create(
    email:"zshanabek@gmail.com", password:"123456789",password_confirmation:"123456789", 
    first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, 
    graduation_date: Faker::Date.between(17.years.ago, Date.today),
    industry_id: Faker::Number.between(1, 22)    
)
20.times do
    User.create(
        email: Faker::Internet.email, password:"123456789",password_confirmation: "123456789", 
        first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, 
        graduation_date: Faker::Date.between(17.years.ago, Date.today),
        industry_id: Faker::Number.between(1, 22)        
    )
end
20.times do
    Vacancy.create(
        title: Faker::Job.title, salary: Faker::Number.decimal(2), 
        responsibilities: Faker::Job.key_skill, demands: Faker::Job.key_skill, 
        user_id: Faker::Number.between(1, 20)
    )
end
