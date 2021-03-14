class DishIngredientsController < ApplicationController

  def show
    @dish_ingredient = dish_ingredient.find(params[:id])
    @ingredients = Ingredient.all
  end

  def new
    @dish_ingredient = DishIngredient.new
    @dish = Dish.find(params[:format])
    @dish_ingredient.dish = @dish
  end

  def create
    @dish_ingredient = DishIngredient.new(dish_ingredient_params)
    @dish = Dish.find(params[:dish_id])
    @dish_ingredient.dish = @dish

    @ingredient = Ingredient.find(params[:dish_ingredient][:ingredient])
    @dish_ingredient.ingredient = @ingredient

    if @dish_ingredient.save!
      redirect_to restaurant_dish_path(@dish.restaurant, @dish), notice: "Ingredients have been added to dish..."
    else
      render :new
    end
  end

  private

  def dish_ingredient_params
    params.require(:dish_ingredient).permit(
      :base_quantity, :min_quantity, :max_quantity, :dish_id, :ingredient_id
    )
  end
end
