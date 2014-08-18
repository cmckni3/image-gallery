Rails.application.routes.draw do
  resources :galleries do
    resources :images
  end

  root 'home#index'
  get 'home/index'
end
