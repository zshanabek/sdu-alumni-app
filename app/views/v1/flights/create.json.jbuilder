json.data do 
    json.flight do
        json.call(
            @flight,
            :id,
            :departure_city,
            :departure_time,
            :arrival_city,
            :arrival_time,
            :created_at,
            :updated_at,            
            :user_id
        )
    end
end