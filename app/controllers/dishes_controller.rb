class DishesController < ApplicationController
  before_action :set_dish, only: :show

  def show
    @dish = Dish.find(params[:id])
    @ingredients = @dish.ingredients
    @dish_ingredients = @dish.dish_ingredients
  end

  def increase_amount
    @dish = Dish.find(params[:dish_id])
    @ingredients = @dish.ingredients
    @dish_ingredients = @dish.dish_ingredients
    @ingredients.each do |ingredient|
      @dish_ingredients.each do |dish_ingredient|
        dish_ingredient.base_quantity += ingredient.change_increment
      end
    end
  end

  def decrease_amount
    @dish = Dish.find(params[:dish_id])
    @ingredients = @dish.ingredients
    @dish_ingredients = @dish.dish_ingredients
    @ingredients.each do |ingredient|
      @dish_ingredients.each do |dish_ingredient|
        dish_ingredient.base_quantity -= ingredient.change_increment
      end
    end
  end


  def create
    @dish = Dish.new(dish_params)
    @restaurant = @dish.restaurant

    if dish.save
      redirect_to dish_path(@dish)
    else
      render :new
    end
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
