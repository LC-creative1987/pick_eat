class DishIngredientsController < ApplicationController
  before_action :set_dish_ingredient, only: [:show, :edit, :update, :destroy]

  def show
    @dish_ingredient = DishIngredient.find(params[:id])
    @ingredients = Ingredient.all
  end

  def new
    @dish_ingredient = DishIngredient.new
    @dish = Dish.find(params[:dish_id])
    # :format
    @dish_ingredient.dish = @dish
    @restaurant = @dish.restaurant
  end

  def create
    @dish_ingredient = DishIngredient.new(dish_ingredient_params)
    @dish = Dish.find(params[:dish_id])
    @dish_ingredient.dish = @dish

    @ingredient = Ingredient.find(params[:dish_ingredient][:ingredient])
    @dish_ingredient.ingredient = @ingredient

    if @dish_ingredient.save!
      redirect_to edit_dish_path(@dish), notice: "Ingredients have been added to dish..."
    else
      render :new
    end
  end

  def edit
    @dish = Dish.find(params[:dish_id])
    @restaurant = @dish.restaurant
    @ingredients = Ingredient.where(restaurant: params[:restaurant_id])
    @dish_ingredients = @dish.dish_ingredients
    @dish_ingredient = DishIngredient.new

    @ingredient = Ingredient.where(dish_ingredient: params[:dish_ingredient_id])

    unless @restaurant.user == current_user
      redirect_to @restaurant
    end
  end

  def update
    @dish = Dish.find(params[:dish_id])
    @dish_ingredient.update(dish_ingredient_params)
    redirect_to edit_dish_path(@dish)
  end

 private

  def set_dish_ingredient
    @dish_ingredient = DishIngredient.find(params[:id])
  end

  def dish_ingredient_params
    params.require(:dish_ingredient).permit(:base_quantity, :min_quantity, :max_quantity, :dish_id, :ingredient_id)
  end
end
