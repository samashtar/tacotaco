class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:notice] = "No user found with that username/password"
      redirect_to '/'
    end
  end

  def destroy
    current_user.tacos = []
    session[:user_id] = nil
    redirect_to '/'
  end

  private

end
