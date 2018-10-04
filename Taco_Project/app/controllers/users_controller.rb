class UsersController < ApplicationController

  before_action(:find_user, only: [:show, :edit, :update, :remove_taco])
  before_action(:require_login, only: [:show, :edit, :update])

  def new
    @user = User.new
    @locations = Location.all
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @locations = Location.all
      render :new
    end
  end

  def show
  end

  def edit
    @locations = Location.all
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def remove_taco
    @user.remove_taco(params[:user][:taco_id].to_i)
    redirect_to '/orders'
  end

  private

  def find_user
    @user = User.find(session[:user_id])
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
