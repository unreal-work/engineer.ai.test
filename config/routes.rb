Rails.application.routes.draw do

  get 'answers/create'
  # get 'home/index'
  devise_for :users

  root 'home#index'

  resources :questions do
    get :follow, on: :member
    get :unfollow, on: :member
  end

  resources :answers, only: [:create] do
    get :vote_up, on: :member
    get :vote_down, on: :member
  end
end
