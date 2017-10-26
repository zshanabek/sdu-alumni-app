# frozen_string_literal: true

module V1
  class FlightController < ApplicationController
    before_action :set_flight, only: [:show, :update, :destroy]
    
    def index
        @flights = current_user.vacancies

        render :index, status: :ok
    end

    def feed
        @flights = Flight.all

        render :index, status: :ok
    end

    def show
        render :show, status: :ok
    end
    
    def create
        @flight = Flight.new(flight_params)
    
        if @flight.save!
            render :create, status: :created
        else
            render json: @flight.errors, status: :unprocessable_entity 
        end
    end
    
    def update
        if @flight.update(flight_params)
            render :show, status: :ok, location: @flight 
        else
            render json: @flight.errors, status: :unprocessable_entity 
        end
    end
    
    def destroy
        @flight.destroy 
        head :no_content 
    end
    
    private
        def set_flight
            @flight = Flight.find(params[:id])
        end
    
        def flight_params
            params.require(:flight).permit(:departure_city,  :arrival_city, :departure_time, :arrival_time, :user_id)
        end

        def current_user
            @current_user = User.find(params[:user_id])
        end
  end  
end
