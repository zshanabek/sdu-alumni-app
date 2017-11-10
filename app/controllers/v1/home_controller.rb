class V1::HomeController < ApplicationController
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
    @users = paginate User.where.not(id: @friends.unshift(current_user)), per_page: 10
    render :find_friends, status: :ok
  end


end
