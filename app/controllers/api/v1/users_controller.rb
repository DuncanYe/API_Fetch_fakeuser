class Api::V1::UsersController < ApiController

  def index
    @users = User.all
    # render json: @users
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

  def create
    @user = User.new(user_params)
    if @user.save
       render json: {
        message: "User created successfully!",
        result: @user
        }
    else
      render json: {
        errors: @user.errors
      }
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update
      render json: {
        message: "User updated successfully",
        result: @user
      }
    else
      render json: {
        errors: @user.errors
      }
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    render json: {
      message: "user destroy successfully"
    }
  end

  private

  def user_params
    params.permit(:email, :name, :gender, :age, :region, :phone, :avatar)
  end

end