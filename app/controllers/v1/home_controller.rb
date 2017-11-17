class V1::HomeController < ApplicationController

  has_scope :by_specialty
  has_scope :by_industry, :type => :array
  has_scope :by_faculty  
  has_scope :by_period, :using => [:started_at, :ended_at], :type => :hash
  
  def index

    render :index, status: :ok
  end

  def activities
    @activities = PublicActivity::Activity.order(created_at: :desc)
    render json: @activities    
  end

  def find_friends
    @users = apply_scopes(User).all
    @users = paginate @users.uniq, per_page: 10
    render  :template => "v1/users/index", status: :ok            
  end
  def faculties
    @faculties = Faculty.all
    render  :faculties , status: :ok
  end
  def specialties
    @specialties = Specialty.all    
    render :specialties , status: :ok
  end
  def industries
    @industries = Industry.all    
    render :industries , status: :ok
  end
end
