Twkunion::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users, controllers: {
    omniauth_callbacks: :authentications
  }

  devise_scope :user do
    resources :authentications, except: [:new, :create, :edit, :show]
  end
  
  root :to => 'home#index'
end
