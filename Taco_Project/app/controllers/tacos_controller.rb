class TacosController < ApplicationController

  before_action(:find_taco, only: [:show, :edit, :update, :destroy])

  def new
    @user = current_user
    @taco = Taco.new
    @category = Category.all
  end

  def create
    @user = current_user
    @taco = Taco.new(taco_params)
    if @taco.valid?
      @taco.save
      @user.tacos << @taco
      @user.save
      redirect_to orders_path
    else
      redirect_to :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @taco.update(taco_params)
    if @taco.valid?
      redirect_to @taco
    else
      redirect_to :edit
    end
  end

  def destroy
    @taco.destroy
    redirect_to orders_path
  end

  private

  def find_taco
    @taco = Taco.find(params[:id])
  end

  def taco_params
    params.require(:taco).permit(
      :tortilla,
      :bean,
      :protein,
      sauces:[],
      toppings:[]
    )
  end

end
