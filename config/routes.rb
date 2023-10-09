Rails.application.routes.draw do
  get 'search', to: "search#index"
  get 'users/profile'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }


  get "/u/:id", to: "users#profile", as: :user

  resources :posts do
    resources :comments
  end
  get "about", to: "pages#about", as: :about

  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"
end
