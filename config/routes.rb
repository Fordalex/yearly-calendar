Rails.application.routes.draw do
  devise_for :users
  root to: "home#home"

  namespace :admin do
    root to: "home#home"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
