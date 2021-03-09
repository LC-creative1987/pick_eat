class DishIngredientsController < ApplicationController
before_action :set_dish_ingredient

  def show
    @dish_ingredient = dish_ingredient.find(params[:id])
    @ingredients = Ingredient.all
  end

  def create
    @dish_ingredient = Dish_ingredient.new(dish_ingredient_params)

    if dish_ingredient.save
      redirect_to @dish_ingredient.dish, notice: "Ingredients has been added to dish..."
    else
      render :new
    end
  end

  private

  def set_dish_ingredient
    @dish_ingredient = dish_ingredient.find(params[:id])
  end

  def dish_ingredient_params
    params.require(:dish_ingredient).permit(
      :base_quantity, :min_quantity, :max_quantity, :dish_id, :ingredient_id
    )
  end
end
