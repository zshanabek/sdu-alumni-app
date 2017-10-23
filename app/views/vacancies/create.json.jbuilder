json.data do 
    json.vacancy do
        json.call(
            @vacancy,
            :id,
            :title,
            :salary,
            :responsibilities,
            :demands,
            :created_at,
            :updated_at,            
            :user_id
        )
    end
end