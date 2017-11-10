class V1::HomeController < ApplicationController
  # before_action :authenticate_user!, except: :front
  def index
    @friends = @user.all_following.unshift(@user)
    @activities = PublicActivity::Activity.where(owner_id: @friends).order(created_at: :desc)
    render json: @activities
  end

  def front
    @activities = PublicActivity::Activity.order(created_at: :desc)
    render json: @activities    
  end

  def find_friends
    @friends = current_user.friends.to_ary
    @users =  User.where.not(id: @friends.unshift(current_user))
    render :find_friends, status: :ok
  end


end
