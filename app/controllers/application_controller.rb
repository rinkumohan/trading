class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authorize_resource
  helper_method :current_user
  helper_method :user_logged_in?

  def current_user
    User.find_by(id: session[:user_id])
  end

  def user_logged_in?
    !current_user.nil?
  end

  private

  def authorize_resource
    redirect_to '/welcome' unless user_logged_in?
  end

end
