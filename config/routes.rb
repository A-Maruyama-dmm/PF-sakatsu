Rails.application.routes.draw do
  #user用
  devise_for :users,skip: [:passwords,], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}


  #管理者用
  #devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  #sessions: "admin/sessions"
#}

  root to: 'user/homes#top'
  get 'homes/about' => 'user/homes#about'


  # 会員側のルーティング設定

  resources :user, only: [:index, :show, :edit, :update] do
    member do
      get :followings, :followers
    end

  resources :relationships, only: [:create, :destroy]
  end

  resources :posts, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    get 'authorization', as: 'authorization'
  end

  end
