json.data do
  json.array! @vacancies do |vacancy|
    json.partial! 'v1/vacancies/vacancy', vacancy: vacancy
  end
end
  