# frozen_string_literal: true

module V1
  class UsersController < ApplicationController
    before_action :authenticate_user
    before_action :set_user, only: [:show, :update, :destroy]
    def create
      @user = User.new(user_params)      
      if @user.save
        render :create
      else
        head(:unprocessable_entity)
      end
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

    def delete
      @user.destroy 
      head :no_content 
    end

    private
    def set_user
      @user = User.find(params[:id])
    end
    def user_params 
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :admission_date, :graduation_date , :specialty_id , :industry_id, :job_title_id)
    end
  end
end
