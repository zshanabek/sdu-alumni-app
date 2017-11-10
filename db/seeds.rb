DatabaseCleaner.clean_with(:truncation)

Industry
fields = ['Маркетинг', 'Информационные технологии', 'Бухгалтерский учёт', 'Администрация', 
          'Рекламное дело', 'Банкинг', 'Общественные услуги', 'Строительство', 'Консалтинг', 
          'Дизайн', 'Образование', 'Фермерское дело', 'Государственная служба', 'Здравохранение', 
          'Гостевое дело', 'Юриспруденция', 'Производство', 'Маркетинг', 'Mining', 'Real-Estate', 
          'Retail', 'Продажи', 'Технологии']
fields.each {
     |i| Industry.create(name: i)
}

falculties = ['Инженерии и естественных наук','Юриспруденции и соц.-гум. наук','Педогогических и гуманитарных наук','Бизнес-школа СДУ']

specialties2 = ['Юриспруденция','Международные отношения','Международное право','История','Журналистика']
specialties3 = ['Филология','Переводческое дело','Иностранный язык: два иностранных языка','Казахский язык и литература','Иностранная филология','Физика - Информатика (педагогическая)','Химия - Биология (педагогическая)','Математика (педагогическая)']
specialties1 = ['Информационные системы','Вычислительная техника и программное обеспечение','Математика (научная)']
specialties4 = ['Учет и аудит','Финансы','Маркетинг','Экономика','Менеджмент']

falculties.each{|i| Falculty.create(name: i)}
specialties1.each{|i| Specialty.create(name: i , falculty_id: 1)}
specialties2.each{|i| Specialty.create(name: i , falculty_id: 2)}
specialties3.each{|i| Specialty.create(name: i , falculty_id: 3)}
specialties4.each{|i| Specialty.create(name: i , falculty_id: 4)}

User.destroy_all
User.create(
    email:"zshanabek@gmail.com", password:"123456789",password_confirmation:"123456789", 
    first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, 
    graduation_date: Faker::Date.between(17.years.ago, Date.today)
)
20.times do
    User.create(
        email: Faker::Internet.email, password:"123456789",password_confirmation: "123456789", 
        first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, 
        graduation_date: Faker::Date.between(17.years.ago, Date.today)
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
