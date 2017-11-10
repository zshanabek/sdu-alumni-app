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
    start_year = params[:start_year].to_i
    end_year = params[:end_year].to_i
  
    
    @friends = current_user.friends.to_ary
    @not_friends =  User.where.not(id: @friends.unshift(current_user))

    @same_years = []

    range = start_year..end_year
    for i in @not_friends
      y = range === i.graduation_date.year.to_i
      if y
        @same_years.push(i)
      end
    end

    @users = paginate @same_years, per_page: 10

    render :find_friends, status: :ok
  end


end
