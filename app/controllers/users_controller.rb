class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    if @user.save
      render json: @user.as_json(only: [ :email, :first_name, :last_name ])
    else
      render json: { message: " Issue saving user ", error: @user.errors.full_messages }
    end
  end

  def index
    render json: { users: User.all.map(&:as_json) }
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :username)
  end
end
