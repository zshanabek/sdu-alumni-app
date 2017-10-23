# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  
  namespace :v1, defaults: { format: :json } do
    resources :vacancies
    
    resources :users, only: %i[create]
      
    resource :sessions, only: %i[create destroy show]
  end

end
