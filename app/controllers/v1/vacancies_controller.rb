# frozen_string_literal: true

module V1
    class VacanciesController < ApplicationController
        before_action :set_vacancy, only: [:show, :update, :destroy]
        
        def index
            @vacancies = current_user.vacancies

            render :index, status: :ok
        end

        def feed
            @vacancies = Vacancy.all

            render :index, status: :ok
        end

        def show
            render :show, status: :ok
        end
        
        def create
            @vacancy = Vacancy.new(vacancy_params)
        
            if @vacancy.save
                render :create, status: :created
            else
                render json: { errors: @vacancy.errors.messages },
                status: :unprocessable_entity
            end

        end
        
        def update
            if @vacancy.update(vacancy_params)
                render :show
            else
                head(:unprocessable_entity)                
            end
        end
        
        def destroy
            if @vacancy.destroy 
                head(:ok)
            else
                head(:unprocessable_entity)
            end
        end
        
        private
            def set_vacancy
                @vacancy = current_user.vacancies.find(params[:id])
            end
        
            def vacancy_params
                params.require(:vacancy).permit(:title, :salary, :responsibilities, :demands, :user_id)
            end

            def current_user
                @current_user = User.find(params[:user_id])
            end
        
    end
end