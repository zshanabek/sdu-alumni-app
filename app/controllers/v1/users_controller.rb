# frozen_string_literal: true

module V1
  class UsersController < ApplicationController
    def create
      @user = User.new(user_params)      
      if @user.save!
        render :create
      else
        head(:unprocessable_entity)
      end
    end

    def index
    end

    def update
    end

    def destroy
    end
    
    private
      def user_params 
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :graduation_date,:industry_id, :country_id)
      end

  end
end
