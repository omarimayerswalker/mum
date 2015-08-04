Rails.application.routes.draw do

  devise_for :users, :path => 'accounts'

  resources :images

  resources :users do
    resources :images
  end

  root "images#index"

end
