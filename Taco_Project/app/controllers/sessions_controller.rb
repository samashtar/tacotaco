class SessionsController < ApplicationController

  def new

  end

  def create
    if !params[:username].nil? && !params[:username].empty?
      @user = User.find_by(username: params[:username])
      if @user.valid?
        byebug
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:username] = @user.username
        redirect_to user_path(@user)
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

  private

end
