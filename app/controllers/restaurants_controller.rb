class RestaurantsController < ApplicationController

  def show
    @restaurant = Restaurant.find(params[:id])
    @dishes = @restaurant.dishes
  end
end
