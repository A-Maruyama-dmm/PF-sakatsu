Rails.application.routes.draw do
  #user用
  devise_for :users,skip: [:passwords,], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}


  #管理者用
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


  # 会員側のルーティング設定
  scope module: :user do
  root to: 'homes#top'
  get '/about' => 'homes#about'
  resources :post, only: [:new, :index, :show, :edit, :destroy]
  end


  # 管理者側のルーティング設定
  namespace :admin do
    get '/' => 'homes#top'

  end


end
