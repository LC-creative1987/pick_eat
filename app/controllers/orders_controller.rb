class OrdersController < ApplicationController
  before_action :set_order, only: :show

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @added_dish_price = 0
    @total_price = 0
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
