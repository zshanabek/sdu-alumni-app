class VacanciesController < ApplicationController
    before_action :set_vacancy, only: [:show, :update, :destroy]
    
    def index
        @vacancies = Vacancy.all

        render :index, status: :ok
    end

    def show
        render :show, status: :ok
    end
    
    def create
        @vacancy = Vacancy.new(vacancy_params)
    
        if @vacancy.save!
            render :create, status: :created
        else
            render json: @vacancy.errors, status: :unprocessable_entity 
        end

    end
    
    def update
        if @vacancy.update(vacancy_params)
            render :show, status: :ok, location: @vacancy 
        else
            render json: @vacancy.errors, status: :unprocessable_entity 
        end
    end
    
    def destroy
        @vacancy.destroy 
        head :no_content 
    end
    
    private
        def set_vacancy
            @vacancy = Vacancy.find(params[:id])
        end
    
        def vacancy_params
            params.require(:vacancy).permit(:title, :salary, :responsibilities, :demands, :user_id)
        end
      
end
