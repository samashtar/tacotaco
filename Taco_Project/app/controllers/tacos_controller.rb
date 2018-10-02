class TacosController < ApplicationController

def new
  @user = current_user
  @taco = Taco.new
  @category = Category.all

end

def create
  # byebug
  @user = current_user
  # @ingredient_ids = []
  # @ingredient_ids << params[:taco][:tortillas]
  # @ingredient_ids += params[:taco][:sauces]
  # @ingredient_ids << params[:taco][:beans]
  # @ingredient_ids << params[:taco][:proteins]
  # @ingredient_ids += params[:taco][:toppings]
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
  @taco = Taco.find(params[:id])
end

def edit
  @taco = Taco.find(params[:id])
end

def update
  @taco = Taco.find(params[:id])
  @taco.update(taco_params)
  if @taco.valid?
      redirect_to @taco
    else
      redirect_to :edit
    end

end

def destroy
  @taco = Taco.find(params[:id])
  @taco.destroy

  redirect_to orders_path
end

private

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
