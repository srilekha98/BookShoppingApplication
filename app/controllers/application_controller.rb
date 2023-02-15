class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :admin_user
  helper_method :logged_in?
  before_action :authorized

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def admin_user
    if session[:admin_id]
      @admin_user ||= Admin.find(session[:admin_id])
    else
      @admin_user = nil
    end
  end

  def logged_in?
     !current_user.nil? or !admin_user.nil?
  end
  def authorized
    redirect_to root_path unless logged_in?
  end

end