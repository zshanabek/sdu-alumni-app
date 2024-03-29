# frozen_string_literal: true
module V1
  class UsersController < ApplicationController
    before_action :authenticate_user!, except: [:create, :current_friends]
    before_action :set_user, :set_industries, only: [:show, :update, :destroy]
    before_action :interested_user, only: :current_friends
    
    def create
      @user = User.new(user_params)  
      if @user.save
        render :create, status: :created
      else
        render json: {errors: @user.errors.messages }, status: :unprocessable_entity
      end
    end

    def show      
      render :show, status: :ok
    end

    def update
      if current_user == @user
        if @user.update(user_params)
          render :show
        else
            head(:unprocessable_entity)                
        end
      else
        head(:unauthorized)
      end
    end

    def destroy
      if current_user == @user        
        @user.destroy 
        head :no_content
      else
        head :unauthorized
      end
    end

    def current_friends
      @users = @user.friends.to_ary
      if @users.empty?
        render json: {'info':'No friends'}  
      else
        @users.sort_by! &:first_name
        render :index, status: :ok
      end
    end

    private
    def interested_user
      @user = User.find(params[:user_id])      
    end
    def set_user
      @user = User.find(params[:id]) 
    end

    def set_industries
      @industries = @user.industries   
      if @industries[0]==nil
        @industry = nil 
      else 
        @industry = @industries.ids
      end
    end
    def user_params 
      params.require(:user).permit(
        :email,  :password, :password_confirmation, :first_name, 
        :last_name, :graduation_date, :specialty_id, :faculty_id,:avatar, :industry_ids=>[]
      )
    end
  end
end
