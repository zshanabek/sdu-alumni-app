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
    count = 0
    params.each do |key,value|
      if value==nil
        count+=1
      end
    end
    if count == 2
      @users =  paginate current_user.friends.to_ary, per_page: 10
    else
      # not_friends
      @users = User.all

      # years
      start_year = params[:start_year].to_i
      end_year = params[:end_year].to_i
    
      @same_years = []

      range = start_year..end_year
      for i in @friends
        y = range === i.graduation_date.year.to_i
        if y
          @same_years.push(i)
        end
      end

      @users = paginate @same_years, per_page: 10
    end
    render :find_friends, status: :ok
  end


end
