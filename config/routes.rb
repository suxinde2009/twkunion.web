Twkunion::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
    omniauth_callbacks: :authentications
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

  scope '/my' do
    get :notificaitons, to: 'users#notifications', as: :my_notificaitons
    get 'profile/edit' => 'users#edit', as: :edit_profile
    put 'profile/update' => 'users#update', as: :profile_settings
  end
  
  namespace :bbs do
    root :to => 'home#index'

    resources :boards, only: [:show] do
      resources :posts do
        resources :replies
      end
    end
  end

  get 'bbs_home' => 'pages#bbs_home'
  post 'valums/create' => 'valums#create'
  
  root :to => 'home#index'
end
