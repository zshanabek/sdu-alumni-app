# frozen_string_literal: true

Rails.application.routes.draw do
  get 'flight/index'

  get 'flight/delete'

  get 'flight/update'

  get 'flight/show'

  get 'flight/create'

  devise_for :users
  
  namespace :v1, defaults: { format: :json } do
    resources :users, only: %i[create] do 
      resources :vacancies
    end
    resource :sessions, only: %i[create destroy show]
  end
  get 'v1/vacancies' => 'v1/vacancies#feed', :as => :v1_vacancies
end
