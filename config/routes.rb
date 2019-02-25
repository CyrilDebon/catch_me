Rails.application.routes.draw do
  devise_for :users
  root to: 'lines#index'
  resources :lines, only: [:index, :show]
  resources :stops, only: [:show]

  resources :stops, only: [:show] do
    resources :favorites, only: [:index, :create, :destroy]
  end

end
