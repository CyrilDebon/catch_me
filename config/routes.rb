Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :lines, only: [:index, :show]
  resources :stops, only: [:show], shallow: true do
    resources :favorites, only: [:create, :destroy]
  end
  resources :favorites, only: [:index]
end
