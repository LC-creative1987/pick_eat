class OrdersController < ApplicationController
  before_action :set_order, only: :show

  def create
    order = Order.new(order_params)

    if order.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
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
