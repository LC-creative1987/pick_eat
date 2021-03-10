class OrdersController < ApplicationController
  before_action :set_order, only: :show

  def show
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(
      :user_id, :phone_number, :delivery_address, :date, :eta, :total_price
    )
  end
end
