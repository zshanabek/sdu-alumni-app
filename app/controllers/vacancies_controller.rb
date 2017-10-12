class VacanciesController < ApplicationController
    before_action :set_vacancy, only: [:show, :update, :destroy]
    
    # GET /vacancies
    # GET /vacancies.json
    def index
        @vacancies = Vacancy.all

        render json: @vacancies
    end
    
    # GET /vacancies/1
    # GET /vacancies/1.json
    def show
        render json: @vacancy
    end
    
    
    # POST /vacancies
    # POST /vacancies.json
    def create
        @vacancy = Vacancy.new(vacancy_params)
    
        if @vacancy.save!
            render json: @vacancy
        else
            render json: @vacancy.errors, status: :unprocessable_entity 
        end

    end
    
    # PATCH/PUT /vacancies/1
    # PATCH/PUT /vacancies/1.json
    def update
        if @vacancy.update(vacancy_params)
            render :show, status: :ok, location: @vacancy 
        else
            render json: @vacancy.errors, status: :unprocessable_entity 
        end
    end
    
    # DELETE /vacancies/1
    # DELETE /vacancies/1.json
    def destroy
        @vacancy.destroy 
        head :no_content 
    end
    
    private
        # Use callbacks to share common setup or constraints between actions.
        def set_vacancy
            @vacancy = Vacancy.find(params[:id])
        end
    
        # Never trust parameters from the scary internet, only allow the white list through.
        def vacancy_params
            params.require(:vacancy).permit(:title, :salary, :responsibilities, :demands, :user_id)
        end
      
end
