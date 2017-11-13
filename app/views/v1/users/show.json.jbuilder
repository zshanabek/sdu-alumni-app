json.is_friend current_user.friends_with?(@user)
json.friends @user.friends.count
json.data do    
    json.partial! 'v1/users/user', user: @user 
    json.industry @industry
end