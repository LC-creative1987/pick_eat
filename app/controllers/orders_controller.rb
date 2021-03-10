class OrdersController < ApplicationController
  before_action :set_order, only: :show

  def show
  end

  def new
  end

  def create
    if @order.present?
      @order << dish
    else
      order = Order.new()
      order << dish
      if order.save
        redirect_to order_path(order)
      else
        render :new
      end
    end
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
