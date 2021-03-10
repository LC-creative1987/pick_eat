class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :edit, :update, :destroy]

  def index
    @dishes = Dish.all
  end

  def show
    @dish = Dish.find(params[:id])
    @ingredients = Ingredient.where(restaurant: params[:restaurant_id])
    @dish_ingredient = DishIngredient.new
  end

  def new
    @dish = Dish.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @dish.restaurant = @restaurant
  end

  def create
    @dish = Dish.new(dish_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @dish.restaurant = @restaurant

    if @dish.save
      redirect_to restaurant_dish_path(@restaurant, @dish)
    else
      render :new
    end
  end


  def edit
  end

  def update
    @dish.update(dish_params)
    redirect_to restaurant_dish_path(@restaurant, @dish)
  end

  def destroy
    @dish.destroy
    redirect_to restaurant_dishes_path
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
