class CustomizedIngredientsController < ApplicationController
  def increase_amount
    # @order_item = OrderItem.find(params[:customized_ingredient_id])
    customized_ingredient = CustomizedIngredient.find(params[:customized_ingredient_id])
    ingredient = customized_ingredient.dish_ingredient.ingredient
    customized_ingredient.quantity += ingredient.change_increment

    if customized_ingredient.quantity < customized_ingredient.dish_ingredient.max_quantity
      customized_ingredient.save
      redirect_to order_item_path(customized_ingredient.order_item, anchor: "customized_ingredient-#{customized_ingredient.id}")
    else
      redirect_to order_item_path(customized_ingredient.order_item, notice: "The value can not be bigger then the max", anchor: "customized_ingredient-#{customized_ingredient.id}")
    end
  end

  def decrease_amount
    customized_ingredient = CustomizedIngredient.find(params[:customized_ingredient_id])
    ingredient = customized_ingredient.dish_ingredient.ingredient
    customized_ingredient.quantity -= ingredient.change_increment

    if customized_ingredient.quantity > customized_ingredient.dish_ingredient.min_quantity
      customized_ingredient.save
      redirect_to order_item_path(customized_ingredient.order_item, anchor: "customized_ingredient-#{customized_ingredient.id}")
    else
      redirect_to order_item_path(customized_ingredient.order_item, notice: "The value can not be samller then then min", anchor: "customized_ingredient-#{customized_ingredient.id}")
    end
  end
end

