class OrdersController < ApplicationController

  before_action(:find_user, only: [:index, :finalize, :finalized])

  def index
  end

  def finalize
  end

  def finalized
  end

  private

  def find_user
    @user = current_user
  end

end
