Twkunion::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
    omniauth_callbacks: :authentications
  }

  devise_scope :user do
    resources :authentications, except: [:new, :create, :edit, :show]
  end

  namespace :bbs do
    root :to => 'home#index'

    resources :boards, only: [:show]
    resources :topics
  end
  
  root :to => 'home#index'
end
