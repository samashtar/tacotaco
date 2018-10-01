class SessionsController < ApplicationController

  def new

  end

  def create
    if !params[:username].nil? && !params[:username].empty?
      if User.find_by(username: params[:username])
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id
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
