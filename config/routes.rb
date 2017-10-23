Rails.application.routes.draw do
  resources :vacancies,  defaults: { format: :json }
  devise_for :users
  root to: "home#index"
  match 'users' => 'users#create', via: :post,  defaults: { format: :json }
  resource :sessions, only: %i[create destroy show],  defaults: { format: :json }  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
