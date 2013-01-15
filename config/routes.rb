Twkunion::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
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

    resources :boards, only: [:show] do
      resources :posts do
        resources :replies
      end
    end

    get 'boards/:board_id' => 'posts#index', as: :board_posts
  end

  get 'bbs_home' => 'pages#bbs_home'
  post 'valums/create' => 'valums#create'
  
  root :to => 'home#index'
end
