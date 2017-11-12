DatabaseCleaner.clean_with(:truncation)

fields = ['Маркетинг', 'Информационные технологии', 'Бухгалтерский учёт', 'Администрация', 
          'Рекламное дело', 'Банкинг', 'Общественные услуги', 'Строительство', 'Консалтинг', 
          'Дизайн', 'Образование', 'Сельское хозяйство', 'Государственная служба', 'Здравохранение',
          'Юриспруденция', 'Производство', 'Добывающая отрасль', 'Искусство, культура', 
          'Розничная торговля','Недвижимость', 'Продажи', 'Электроника, приборостроение, бытовая техника, компьютеры и оргтехника',
          'Автомобильный бизнес','Энергетика','Телекоммуникации, связь','Услуги для населения',
          'Услуги для бизнеса','Страхование','Товары народного потребления',
          'Промышленное оборудование, техника, станки и комплектующие','Гостиницы, рестораны, общепит, кейтеринг'
         ]
fields.each {|i| Industry.create(name: i)}

faculties = ['Инженерии и естественных наук','Юриспруденции и социально-гуманитарных наук','Педогогических и гуманитарных наук','Бизнес-школа СДУ']

specialties2 = ['Юриспруденция','Международные отношения','Международное право','История','Журналистика']
specialties3 = ['Филология','Переводческое дело','Иностранный язык: два иностранных языка','Казахский язык и литература','Иностранная филология','Физика - Информатика (педагогическая)','Химия - Биология (педагогическая)','Математика (педагогическая)']
specialties1 = ['Информационные системы','Вычислительная техника и программное обеспечение','Математика (научная)']
specialties4 = ['Учет и аудит','Финансы','Маркетинг','Экономика','Менеджмент']

faculties.each{|i| Faculty.create(name: i)}
specialties1.each{|i| Specialty.create(name: i , faculty_id: 1)}
specialties2.each{|i| Specialty.create(name: i , faculty_id: 2)}
specialties3.each{|i| Specialty.create(name: i , faculty_id: 3)}
specialties4.each{|i| Specialty.create(name: i , faculty_id: 4)}

User.create(
    email:"zshanabek@gmail.com", password:"123456789",password_confirmation:"123456789", 
    first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, 
    graduation_date: Faker::Date.between(17.years.ago, Date.today),
    faculty_id:  Faker::Number.between(1, 4),
    specialty_id: Faker::Number.between(1, 21)
)
20.times do
    User.create(
        email: Faker::Internet.email, password:"123456789",password_confirmation: "123456789", 
        first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, 
        graduation_date: Faker::Date.between(17.years.ago, Date.today),
        faculty_id:  Faker::Number.between(1, 4),
        specialty_id: Faker::Number.between(1, 21)
    )
end
20.times do
    Vacancy.create(
        title: Faker::Job.title, salary: Faker::Number.decimal(2), 
        responsibilities: Faker::Job.key_skill, demands: Faker::Job.key_skill, 
        user_id: Faker::Number.between(1, 20)
    )
end
