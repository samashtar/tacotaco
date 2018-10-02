class TacosController < ApplicationController

def new
  @user = current_user
  @taco = Taco.new
  @category = Category.all

end

def create
  @user = current_user
  @taco = Taco.create(ingredient_ids:params[:ingredients][:ingredient_id].compact)
  @user.tacos << @taco
  if @taco.valid?
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
  @taco.update(ingredient_ids:params[:ingredients][:ingredient_id].compact)
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
end

end
