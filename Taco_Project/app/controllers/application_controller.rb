class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def index
    
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      redirect_to login_path and return
    end
  end

end
