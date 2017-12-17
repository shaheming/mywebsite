Rails.application.routes.draw do
  resource :wechat, only: [:show, :create]
  devise_for :users
  root "welcome#index"
  namespace :admin do
    get "/" => "welcome#index"
    resources :images
    resources :wechat
  end

  resources :meetups
  resources :posts, only: [:destroy, :create]

  namespace :api, :defaults =>{:format => :json} do
    namespace :v1 do
      get "/test" => "test#index", :as => :test

      get "/meetups" => "meetups#index", :as => :meetups
      
      post "/signup" => "auth#signup"
      post "/login" => "auth#login"
      post "/logout" => "auth#logout"

    end
  end
end
