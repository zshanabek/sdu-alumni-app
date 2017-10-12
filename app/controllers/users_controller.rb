class UsersController < ApplicationController
  acts_as_token_authentication_handler_for User, except: [:create]  
  def create
    @user = User.create({
      :first_name => params[:first_name],
      :last_name => params[:last_name],        
      :email => params[:email], 
      :password => params[:password], 
      :password_confirmation => params[:password_confirmation],
      :admission_date => params[:admission_date],  
      :graduation_date => params[:graduation_date],  
      :specialty_id => params[:specialty_id],  
      :industry_id => params[:industry_id],  
      :country_id => params[:country_id]
    })    
    if @user.save!
      render json: @user
    else
      head :unprocessable_entity
    end
  end

  def index
  end

  def update
  end

  def destroy
  end

  def user_params 
    params.require(:user).permit(:password, :password_confirmation, :first_name, :last_name, :email )
  end
end
