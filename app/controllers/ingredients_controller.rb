class IngredientsController < ApplicationController

  def index
    @ingredients = @restaurant.ingredients
  end

end
