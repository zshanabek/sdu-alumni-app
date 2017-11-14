json.data do
    json.array! @faculties do |faculty|
        json.call(
            faculty,
            :id,
            :name
        )
    end
end
