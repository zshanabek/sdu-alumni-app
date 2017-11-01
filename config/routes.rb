# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users
  post 'v1/user_token' => 'v1/user_token#create'
  
  namespace :v1, defaults: { format: :json } do
    resources :users, only: %i[create] do 
      resources :vacancies
      resources :flights
      resources :follows, only: %i[create destroy]      
    end
    resource :sessions, only: %i[create destroy show]
  end
  get 'v1/vacancies' => 'v1/vacancies#feed', :as => :v1_vacancies
  get 'v1/flights' => 'v1/flights#feed', :as => :v1_flights
  
  get 'v1/find_friends' => 'v1/home#find_friends', :as => :v1_find_friends
  root 'v1/home#index'
end
