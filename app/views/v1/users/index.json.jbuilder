json.data do
    json.array! @users do |user|
        json.partial! 'v1/users/user', user: user
        json.industry user.industries.ids
    end
end
