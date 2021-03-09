class DishesController < ApplicationController

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
end
