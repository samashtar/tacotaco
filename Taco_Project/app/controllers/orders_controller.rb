class OrdersController < ApplicationController

  before_action(:find_user, only: [:index, :finalize, :finalized, :add_signature])
  before_action(:require_login)

  def index
    @signatures = Taco.signature_tacos
  end

  def finalize
  end

  def finalized
    ApplicationMailer.receipt_email(@user).deliver_now
    @user.deactivate_tacos
    @user.save
  end

  def add_signature
    @user.tacos << Taco.find(params[:signature_id])
    redirect_to '/orders'
  end

  private

  def find_user
    @user = current_user
  end

end
