# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users
  
  namespace :v1, defaults: { format: :json } do
    resources :users, only: %i[create] do 
      resources :vacancies
    end
    resources :users, only: %i[create] do 
      resources :flight
    end
    resource :sessions, only: %i[create destroy show]
  end
  get 'v1/vacancies' => 'v1/vacancies#feed', :as => :v1_vacancies
  get 'v1/flight' => 'v1/flight#feed', :as => :v1_flights
end
