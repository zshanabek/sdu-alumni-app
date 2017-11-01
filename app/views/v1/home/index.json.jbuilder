json.data do
    json.array! @activities do |activity|
        json.call(
            activity,
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