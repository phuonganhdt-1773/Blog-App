Rails.application.routes.draw do
  devise_for :users, :controllers => {:omniauth_callbacks => "user/omniauth_callbacks" }
  get "/admin", to: "admin/base#home", :as => "admin"
  root "static_pages#home"

  namespace :admin do
    resources :users
    resources :entries
    resources :comments
  end

  resources :users do
    resources :entries
    resources :comments
  end

  resources :entries do
    resources :comments
  end

  resources :follows do
    collection do
      post "follow"
      post "unfollow"
      get "all_follows"
      get "all_following"
    end
  end
end
