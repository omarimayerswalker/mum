Rails.application.routes.draw do

  root "images#index"

  devise_for :users, :path => 'accounts'

  resources :images

  resources :users do
    resources :images
  end

  resources :images do
    resources :comments
  end

  resources :comments do
    member do
    put "like", to: "comments#upvote"
    end
  end


end
