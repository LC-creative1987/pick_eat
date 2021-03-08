class RestaurantsController < ApplicationController
<<<<<<< HEAD
  def index
    @restaurants = Restaurant.all
  end
=======
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def show
    @restaurant = Restaurant.find(params[:id])
    @dishes = @restaurant.dishes
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user  = current_user
    if @restaurant.save
      flash[:success] = "Thanks for adding your restaurant!"
      redirect_to @restaurant
    else
      render :new
      flash[:alert] = "Sorry, your restaurant is not saved!"
    end
  end


  def update
    @restaurant.update(restaurant_params)
    redirect_to @restaurant
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :cuisine)
<<<<<<< HEAD
  end  
>>>>>>> a684d223e63200749ad43338211c794d5692422c
=======
  end
>>>>>>> 73d8e11438c5254be6371dc7459e196ded6910b4
end

