class DishesController < ApplicationController

  def show
    @dish = Dish.find(params[:id])
    @dish_ingredients = @dish.dish_ingredients
    @ingredients = Ingredient.all
  end
end
