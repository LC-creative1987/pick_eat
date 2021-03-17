class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :edit, :update, :destroy]

  def index
    @dishes = Dish.all
  end

  def show
    @ingredients = Ingredient.where(restaurant: params[:restaurant_id])
    @restaurant = @dish.restaurant

    #@restaurant = Restaurant.find(params[:restaurant_id])

    @dish_ingredient = DishIngredient.new
  end

  def new
    @dish = Dish.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @dish.restaurant = @restaurant
    @ingredients = Ingredient.where(restaurant: params[:restaurant_id])
    @dish_ingredient = DishIngredient.new
  end

  def create
    @dish = Dish.new(dish_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @dish.restaurant = @restaurant
    @ingredients = Ingredient.where(restaurant: params[:restaurant_id])
    @dish_ingredient = DishIngredient.new

    if @dish.save
      redirect_to new_dish_dish_ingredient_path(@dish)
      # restaurant_dish_path(@restaurant, @dish)
    else
      render :new
    end
  end

  def edit
    @restaurant = @dish.restaurant
    @ingredients = Ingredient.where(restaurant: params[:restaurant_id])
    @dish_ingredients = @dish.dish_ingredients
    @dish_ingredient = DishIngredient.new

    @ingredient = Ingredient.where(dish_ingredient: params[:dish_ingredient_id])

    unless @restaurant.user == current_user
      redirect_to @restaurant
    end
  end

  def update
    @dish.update(dish_params)
      redirect_to edit_dish_path(@dish)
  end

  def destroy
    @restaurant = @dish.restaurant
    @dish.destroy
    redirect_to restaurant_path(@restaurant)
  end

  private

  def set_dish
    @dish = Dish.find(params[:id])
  end

  def dish_params
    params.require(:dish).permit(
      :name, :base_price, :restaurant_id
    )
  end
end
