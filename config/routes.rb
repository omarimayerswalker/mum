Rails.application.routes.draw do

  root "images#index"

  devise_for :users, :path => 'accounts'

  resources :images

  resources :users do
    resources :images
  end


end
