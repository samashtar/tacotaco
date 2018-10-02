class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def index

  end

  def about

  end

  def current_user
    if !session[:user_id].nil?
      User.find(session[:user_id])
    else
      nil
    end
  end

end
