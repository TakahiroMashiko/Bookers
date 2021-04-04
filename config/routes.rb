Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books

  # アプリケーションのトップ画面を「/」で表示させる
  get '/', to: 'homes#index'
  # ルートパス
  root :to => 'homes#index'
end