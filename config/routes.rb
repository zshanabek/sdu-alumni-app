# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users
  
  namespace :v1, defaults: { format: :json } do
    resources :users do 
      resources :vacancies
      resources :flights
      resources :follows, only: %i[create destroy]      
    end
    resource :sessions, only: %i[create destroy show]
    post 'user_token' => 'user_token#create'  
    get 'vacancies' => 'vacancies#feed', :as => :vacancies
    get 'flights' => 'flights#feed', :as => :flights

    get 'find_friends' => 'home#find_friends', :as => :find_friends
    root 'home#index'  
  end

end
