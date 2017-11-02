json.is_following current_user.following?(@user)
json.follows @user.follow_count
json.followers @user.followers_count
json.data do    
    json.industry @industries[0].name
    json.partial! 'v1/users/user', user: @user
end