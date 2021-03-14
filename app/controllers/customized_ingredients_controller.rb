class CustomizedIngredientsController < ApplicationController
  def increase_amount
    @customized_ingredient = CustomizedIngredient.find(params[:customized_ingredient_id])
    @ingredient = @customized_ingredient.dish_ingredient.ingredient
    @customized_ingredient.quantity += @ingredient.change_increment

    if @customized_ingredient.quantity <= @customized_ingredient.dish_ingredient.max_quantity
      @customized_ingredient.save
      respond_to do |format|
        format.html { redirect_to order_item_path(@customized_ingredient.order_item) }
        format.js
      end
    else
      flash[:notice] = "The value can not be bigger then the max"
      redirect_to order_item_path(@customized_ingredient.order_item)
    end
  end

  def decrease_amount
    @customized_ingredient = CustomizedIngredient.find(params[:customized_ingredient_id])
    @ingredient = @customized_ingredient.dish_ingredient.ingredient
    @customized_ingredient.quantity -= @ingredient.change_increment

    if @customized_ingredient.quantity >= @customized_ingredient.dish_ingredient.min_quantity
      @customized_ingredient.save
      respond_to do |format|
        format.html { redirect_to order_item_path(@customized_ingredient.order_item) }
        format.js
      end
    else
      flash[:notice] = "The value can not be samller then then min"
      redirect_to order_item_path(@customized_ingredient.order_item)
    end
  end
end

