class CustomizedIngredientsController < ApplicationController
  def show
    @customized_ingredients = CustomizedIngredients.find(params[:id])
    @dish_ingredient = @customized_ingredients.dish_ingredient
    @order_item = @customized_ingredients.order_item
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
