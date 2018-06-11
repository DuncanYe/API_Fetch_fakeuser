class Api::V1::UsersController < ApiController

  def index
    @users = User.all
    render json: {
      data: @users.map do |user|
        {
         name: user.name,
         gender: user.gender,
         region: user.region,
         avatar: user.avatar
        }
      end
     }
  end

end
