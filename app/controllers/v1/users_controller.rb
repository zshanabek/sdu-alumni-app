# frozen_string_literal: true
module V1
  class UsersController < ApplicationController
    before_action :authenticate_user!, except: :create   
    before_action :set_user, :set_industries, only: [:show, :current_friends, :update, :destroy]

    def create
      @user = User.new(user_params)  
      params.permit(:industry_id)
      if @user.save!
        render :create
      else
        head(:unprocessable_entity)
      end
      @user.industries << Industry.find(params[:industry_id])          
    end

    def show
      render :show, status: :ok
    end

    def update
      if @user.update(user_params)
        render :show
      else
          head(:unprocessable_entity)                
      end
    end

    def destroy
      @user.destroy 
      head :no_content 
    end

    def current_friends
      @users = @user.friends.to_ary
      if @users.empty?
        render json: {'info':'No friends'}  
      else
        render :index, status: :ok
      end
    end

    private
    def set_user
      @user = User.find(params[:id])     
      if @user==nil       
        @user = User.find(params[:user_id])
      end
    end

    def set_industries
      @industries = @user.industries      
    end
    def user_params 
      params.require(:user).permit(
        :email, :password, :password_confirmation, :first_name, 
        :last_name, :graduation_date, :specialty_id, :faculty_id
      )
    end
  end
end
