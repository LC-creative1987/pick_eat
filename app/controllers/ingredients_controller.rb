class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.where(restaurant: params[:restaurant_id])
    @restaurant = Restaurant.find(params[:restaurant_id])

  end

  def new
    @ingredient = Ingredient.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @ingredient.restaurant = @restaurant
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @ingredient.restaurant = @restaurant

    if @ingredient.save
      redirect_to restaurant_ingredients_path
    else
      render :new
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to restaurant_ingredients_path
  end

private
  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(
      :name, :unit, :change_increment, :cost, :price
    )
  end
end



