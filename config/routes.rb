# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users, defaults: { format: :json }
  
  namespace :v1, defaults: { format: :json } do
    resources :users do 
      resources :vacancies
      resources :flights
      resources :friendships, except: %i[index show update] 
      get 'friends' => 'users#current_friends', :as => :current_friends       
      put 'accept' => 'friendships#update', :as => :accept_friend
      put 'decline' => 'friendships#decline', :as => :decline_friend      
      put 'remove' => 'friendships#destroy', :as => :destroy_friend
      
    end
    resource :sessions, only: %i[create destroy show]
    get 'pending_friends' => 'friendships#index', :as => :pending_friends  
    get 'requested_friends' => 'friendships#requested_friends', :as => :requested_friends        
    get 'vacancies' => 'vacancies#feed', :as => :vacancies
    get 'flights' => 'flights#feed', :as => :flights

    post 'find_friends' => 'home#find_friends', :as => :find_friends
    get 'front' => 'home#front', :as => :front
    root 'home#index'  
  end

end
