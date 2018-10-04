class OrdersController < ApplicationController

  before_action(:find_user, only: [:index, :finalize, :finalized])
  before_action(:require_login)

  def index
    @signatures = Taco.signature_tacos
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
