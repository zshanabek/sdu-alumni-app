class V1::HomeController < ApplicationController

  has_scope :by_degree
  has_scope :by_period, :using => [:started_at, :ended_at], :type => :hash
  before_action :set_faculty, only: :specialties
  
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

    @users = paginate apply_scopes(User).all, per_page: 5
    render  :template => "v1/users/index", status: :ok            
    
  end
  def faculties
    @faculties = Faculty.all
    render  :index , status: :ok
  end
  def specialties
    render  :specialties , status: :ok
  end
  def set_faculty
    @specialties = Specialty.where(:faculty_id => params[:faculty_id])
  end

end
