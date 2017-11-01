class V1::HomeController < ApplicationController
  before_action :authenticate_user
  def index
    @friends = current_user.all_following.unshift(current_user)
    @activities = PublicActivity::Activity.where(owner_id: @friends).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def front
    @activities = PublicActivity::Activity.order(created_at: :desc)
  end

  def find_friends
    @friends = current_user.all_following
    @users =  User.where.not(id: @friends.unshift(current_user))
    render json: @users
  end

end
