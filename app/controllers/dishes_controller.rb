class DishesController < ApplicationController
  before_action :set_dish, only: :show

  def create
    @dish = Dish.new(dish_params)
    @restaurant = @dish.restaurant

    if dish.save
      redirect_to dish_path(@dish)
    else
      render :new
    end
  end

  private

  def set_dish
    @dish = Dish.find(params[:id])
  end

  def dish_params
    params.require(:dish).permit(
      :name, :base_price, :restaurant_id
    )
  end

end
