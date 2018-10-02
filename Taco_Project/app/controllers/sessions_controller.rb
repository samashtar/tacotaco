class SessionsController < ApplicationController

  def new

  end

  def create
    if !params[:username].nil? && !params[:username].empty?
      @user = User.find_by(username: params[:username])
      if @user.valid?
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to '/login'
      end
    else
      redirect_to '/login'
    end
  end

  def destroy
    session.delete[:user_id]
    redirect_to '/login'
  end

  private

end
