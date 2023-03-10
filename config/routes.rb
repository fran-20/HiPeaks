Rails.application.routes.draw do
  root to: "home#top"
  devise_for :users
  resource :user, except: [:new, :create, :destroy]
  resources :mountains, shallow: true do
    resources :reviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end