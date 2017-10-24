# frozen_string_literal: true

module V1
  class UsersController < ApplicationController
    def create
      @user = User.new(user_params)      
      if @user.save
        render :create
      else
        head(:unprocessable_entity)
      end
    end


    private
    def user_params 
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :admission_date, :graduation_date , :specialty_id , :industry_id, :job_title_id)
    end
  end
end
