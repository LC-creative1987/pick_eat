class OrderItemsController < ApplicationController
  before_action :set_order_item, only: :show

  def show
    @ingredients = @order_item.dish.restaurant.ingredients
    @special_request = SpecialRequest.new
    @order_item = OrderItem.find(params[:id])
    @special_request.order_item = @order_item
  end

  def create
    @order = Order.find_or_create_by(user: current_user)
    @dish = Dish.find(params[:format])

    @order_item = OrderItem.new
    @order_item.dish = @dish
    @order_item.order = @order

    if @order_item.save
      # Create the customized ingredients
      @dish.dish_ingredients.each do |dish_ingredient|
        CustomizedIngredient.create(
          order_item: @order_item,
          dish_ingredient: dish_ingredient,
          quantity: dish_ingredient.base_quantity
        )
      end
      redirect_to order_item_path(@order_item)
    end
  end

  def destroy
    if params[:from] == "order"
      @order_item = OrderItem.find(params[:id])
      @order_item.destroy
      redirect_to Order.find_by(user: current_user)
    elsif params[:from] == "checkout"
      @order = Order.find(params[:id])
      @order.order_items.each do |order_item|
        order_item.destroy
      end
      redirect_to restaurants_path
    else
      @order_item = OrderItem.find(params[:id])
      @order_item.destroy
      redirect_to restaurant_path(params[:restaurant_id])
    end
  end

  private

  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end
end
