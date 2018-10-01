class TacosController < ApplicationController

def new
  @taco = Taco.new
end

def create
@taco = Taco.create(ingredient_ids:params[:ingredients][:ingredient_id].compact)
  if
  @taco.valid?
  redirect_to @taco
  else
  redirect_to :new
end
end

def show
@taco = Taco.find(params[:id])
end



def edit
end

def update

end

def destroy
end




private

def taco_params
end







end
