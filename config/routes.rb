Rails.application.routes.draw do
  get 'candidatures/apply_to_position'
  devise_for :candidates
  devise_for :interviewers
  get "my_candidatures", to: 'pages#my_candidatures'
  get "dashboard", to: 'pages#dashboard'
  get "list_candidates", to: 'pages#list_candidates'


  resources :positions do
      member do
        get :find_match
      end
    resources :candidatures do
      member do
        get :apply_to_position
      end
    end
  end
  # devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
