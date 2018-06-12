class ApiController < ActionController::Base
  before_action :authenticate_user_from_token!

  def authenticate_user_from_token!
    if params[:auth_token].present?
      user = User.find_by_authentication_token(params[:auth_token])
      sign_in(user, store: false) if user
    end
  end

  # 由於 API 的防禦機制和 Website 不同，在 ApplicationController 
  # 裡有一行 protect_from_forgery with: :exception，
  # 這行程式會啟動瀏覽器的安全檢查，但是 API 的請求與回應不會通過瀏覽器，
  # 因此不需要這樣的機制。

  # 所以建立此類別，注意superclass 需改成 ActionController::Base

end
