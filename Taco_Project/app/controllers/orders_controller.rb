class OrdersController < ApplicationController
def index
  @user = current_user
end

def finalize
  @user = current_user
end

end
