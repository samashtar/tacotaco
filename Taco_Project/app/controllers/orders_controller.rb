class OrdersController < ApplicationController
def index
  @user = User.find(1)
end


def finalize
  @user = User.find(1)
end



end
