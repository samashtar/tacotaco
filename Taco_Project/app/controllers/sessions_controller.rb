class SessionsController < ApplicationController

  def new

  end

  def create
    if !params[:username].nil? && !params[:username].empty?
      if User.find_by(username: params[:username])
        session[:username] = params[:username]
        user = User.find_by(username: session[:username])
        redirect_to user_path(user)
      else
        redirect_to '/login'
      end
    else
      redirect_to '/login'
    end
  end

  def destroy
    session.delete[:username]
    redirect_to '/login'
  end

end
