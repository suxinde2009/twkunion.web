Twkunion::Application.routes.draw do

  devise_for :users, controllers: {
    sessions: :sessions,
    omniauth_callbacks: :authentications,
    registrations: :registrations
  }

  devise_scope :user do
    resources :authentications, except: [:new, :create, :edit, :show]
  end

  resources :topics do
    resources :topic_posts, path: :posts
    resources :topic_videos, path: :videos
    resources :topic_photos, path: :photos
    resources :topic_downloads, path: :downloads
  end

  resources :feedbacks, only: [:new, :create]

  scope '/my' do
    get 'notificaitons' => 'users#notifications', as: :notifications
    get ':type/edit' => 'users#edit', as: :settings
    put 'profile/update' => 'users#update', as: :users
  end

  resources :users

  scope '/u' do
    get ':uid' => 'users#show', as: :user
  end
  
  namespace :bbs do
    root :to => 'boards#index'

    resources :boards, only: :index do
      resources :posts do
        resources :replies
      end
    end
  end

  get 'bbs_home' => 'pages#bbs_home'
  post 'valums/create' => 'valums#create'

  ActiveAdmin.routes(self)

  root :to => 'home#index'
end
