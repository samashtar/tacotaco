class UsersController < ApplicationController

  before_action(:find_user, only: [:show])

  def new
    @user = User.new
    @locations = Location.all
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to '/'
    else
      redirect_to new_user_path
    end
  end

  def show
  end

  private

  def find_user
    @user = User.find_by(username: session[:username])
  end

  def user_params
    params.require(:user).permit(
      :name,
      :username,
      :password,
      :email,
      :address,
      :phone_number,
      :location_id,
      :taco_points,
      :password_confirmation)
  end

end
