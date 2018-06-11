class ApiController < ActionController::Base

  # 由於 API 的防禦機制和 Website 不同，在 ApplicationController 
  # 裡有一行 protect_from_forgery with: :exception，
  # 這行程式會啟動瀏覽器的安全檢查，但是 API 的請求與回應不會通過瀏覽器，
  # 因此不需要這樣的機制。

  # 所以建立此類別，注意superclass 需改成 ActionController::Base

end
