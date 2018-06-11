class Api::V1::UsersController < ApiController

  def index
    @users = User.all
    render json: {
     data: @users
    }
  end

end
