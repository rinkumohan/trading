class UsersController < ApplicationController

  skip_before_action :authorize_resource, only: [:new, :create]


  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to dashboard_path
  end

  def dashboard

  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
