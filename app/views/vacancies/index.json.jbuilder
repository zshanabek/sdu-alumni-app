json.data do
    json.array! @vacancies do |vacancy|
      json.partial! 'vacancies/vacancy', vacancy: vacancy
    end
  end
  