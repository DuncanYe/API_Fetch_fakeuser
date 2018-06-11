class Api::V1::UsersController < ApiController

  def index
    @users = User.all
    render json: {
      data: @users.map do |user|
        {
         id: user.id,
         name: user.name,
         gender: user.gender,
         region: user.region,
         avatar: user.avatar
        }
      end
     }
  end

  def show
    @user = User.find_by(id: params[:id])
      if !@user 
        render json:{
        message: "can't not find the user!",
        status: 400
      }
    else
      render json: {
        id: @user.id,
        name: @user.name,
        gender: @user.gender,
        region: @user.region,
        avatar: @user.avatar
      }
    end
  end

end