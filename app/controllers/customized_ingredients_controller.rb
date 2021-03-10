class CustomizedIngredientsController < ApplicationController
  def increase_amount
    # @order_item = OrderItem.find(params[:customized_ingredient_id])
    customized_ingredient = CustomizedIngredient.find(params[:customized_ingredient_id])
    ingredient = customized_ingredient.dish_ingredient.ingredient
    customized_ingredient.quantity += ingredient.change_increment

    if customized_ingredient.quantity < customized_ingredient.dish_ingredient.max_quantity
      customized_ingredient.save
      redirect_to customized_ingredient.order_item
    else
      redirect_to customized_ingredient.order_item, notice: "The value can not be bigger then the max"
    end
  end

  def decrease_amount
    customized_ingredient = CustomizedIngredient.find(params[:customized_ingredient_id])
    ingredient = customized_ingredient.dish_ingredient.ingredient
    customized_ingredient.quantity -= ingredient.change_increment

    if customized_ingredient.quantity > customized_ingredient.dish_ingredient.min_quantity
      customized_ingredient.save
      redirect_to customized_ingredient.order_item
    else
      redirect_to customized_ingredient.order_item, notice: "The value can not be samller then then min"
    end
  end
end
