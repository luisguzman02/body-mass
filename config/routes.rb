Rails.application.routes.draw do

  root 'home#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :calculator, only: [:new] do
    collection do
      post :calculate
      get :calculate, to: redirect('/calculator/new')
    end
  end
end
