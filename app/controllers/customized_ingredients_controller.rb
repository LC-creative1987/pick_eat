class CustomizedIngredientsController < ApplicationController
  def increase_amount
    @customized_ingredient = CustomizedIngredient.find(params[:customized_ingredient_id])
    @ingredient = @customized_ingredient.dish_ingredient.ingredient

    if @customized_ingredient.can_increase?
      @customized_ingredient.quantity += @ingredient.change_increment
      @customized_ingredient.save
      respond_to do |format|
        format.html { redirect_to order_item_path(@customized_ingredient.order_item) }
        format.js { render partial: "change_amount" }
      end
    else
      respond_to do |format|
        format.html { redirect_to order_item_path(@customized_ingredient.order_item) }
        format.js { render partial: "error" }
      end
    end
  end

  def decrease_amount
    @customized_ingredient = CustomizedIngredient.find(params[:customized_ingredient_id])
    @ingredient = @customized_ingredient.dish_ingredient.ingredient

    if @customized_ingredient.can_decrease?
      @customized_ingredient.quantity -= @ingredient.change_increment
      @customized_ingredient.save
      respond_to do |format|
        format.html { redirect_to order_item_path(@customized_ingredient.order_item) }
        format.js { render partial: "change_amount" }
      end
    else
      respond_to do |format|
        format.html { redirect_to order_item_path(@customized_ingredient.order_item) }
        format.js { render partial: "error" }
      end
    end
  end
end

