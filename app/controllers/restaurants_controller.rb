class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if !params[:query].present? || params[:query].empty?
      @restaurants = Restaurant.all
    else
      @restaurants = Restaurant.near(params[:query], 10)
    end

    @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { restaurant: restaurant })
        #image_url: helpers.asset_url('images/map.jpg')
      }
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @dishes = @restaurant.dishes
    @ingredients = @restaurant.ingredients

  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user

    if @restaurant.save
      flash[:success] = "Thanks for adding your restaurant!"
      redirect_to @restaurant
    else
      render :new
      flash[:alert] = "Sorry, your restaurant is not saved!"
    end
  end

  def edit
    unless @restaurant.user == current_user
      redirect_to @restaurant
    end
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to @restaurant, notice: "Restaurant was succesfully updated"
  end

  def destroy
    @restaurant.destroy
    redirect_to my_restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :cuisine, :photo)
  end
end
