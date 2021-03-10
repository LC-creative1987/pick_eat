class OrderItemsController < ApplicationController
  def show
    @order_item = OrderItem.find(params[:id])
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
end
