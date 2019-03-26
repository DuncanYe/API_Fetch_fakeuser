Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "photos#index"
  resources :photos
  resources :users

  namespace :api, defaults: {format: :json} do
    namespace :v1 do

      post "/login" => "auth#login"
      post "/logout" => "auth#logout"

      resources :photos, only: [:index, :create, :show, :update, :destroy]
      resources :users, only: [:index, :create, :show, :update, :destroy]
    end
  end

#   namespace :api, default: {format: :json} do
#     namespace :v1 do

#     end
#   end

  # 網址上有兩層 namespace，除了識別用的 /api以外，因為api有可能會更新，加上了版號 /v1提供識別用。
  # defaults: { format: :json } 將回傳給客戶端的格式預設為 JSON。

end
