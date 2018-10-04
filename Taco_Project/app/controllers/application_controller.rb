class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def index

  end

  def about
    require_login
  end

  def current_user
    if !session[:user_id].nil?
      User.find(session[:user_id])
    else
      nil
    end
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end
