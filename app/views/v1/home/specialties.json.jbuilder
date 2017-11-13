json.data do
    json.array! @specialties do |specialty|
        json.call(
            specialty,
            :id,
            :name,
            :faculty_id
        )
    end
end