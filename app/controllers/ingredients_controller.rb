class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @ingredients = @restaurant.ingredients
  end

  def new
    @ingredient = Ingredient.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @ingredient.restaurant = @restaurant
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @ingredient.restaurant = @restaurant

    if @ingredient.save
      redirect_to restaurant_ingredients_path
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])

    @ingredient.restaurant = @restaurant

    unless @restaurant.user == current_user
      redirect_to @restaurant
    end
  end

  def update
    @ingredient.update(ingredient_params)
    redirect_to restaurant_ingredients_path(@ingredient.restaurant,  anchor: "id-#{@ingredient.id}")
  end

  def destroy
    @ingredient.destroy
    redirect_to restaurant_ingredients_path
  end

  def decrease_stock_quantity
    @order = Order.find(params[:ingredient_id])
    @order.order_items.each do |order_item|
      order_item.customized_ingredients.each do |customized_ingredient|
        customized_ingredient.dish_ingredient.ingredient.stock_quantity -= customized_ingredient.quantity
        customized_ingredient.dish_ingredient.ingredient.save!
      end
      order_item.special_requests.each do |special_request|
        special_request.ingredient.stock_quantity -= special_request.quantity
        special_request.ingredient.save!
      end
    end
    redirect_to order_checkout_path(@order)
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(
      :name, :unit, :change_increment, :cost, :price, :stock_quantity
    )
  end
end
