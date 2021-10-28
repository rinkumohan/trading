class SessionsController < ApplicationController

  skip_before_action :authorize_resource, only: [:new, :create, :welcome]
  before_action :find_user, only: [:create]

  def new
    if user_logged_in?
      redirect_to dashboard_path
    end
  end

  def create
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      redirect_to '/login'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to '/welcome'
  end

  private

  def find_user
    @user = User.find_by(username: params[:username])
  end
end
