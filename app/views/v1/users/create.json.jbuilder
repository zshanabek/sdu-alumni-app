json.data do
    json.user do
      json.call(
        @user,
        :id,
        :email,
        :authentication_token,
        :first_name,
        # :last_name,
        # :admission_date
        # :graduation_date,
        # :specialty_id,
        # :industry_id,
        # :job_title_id
      )
    end
  end
  