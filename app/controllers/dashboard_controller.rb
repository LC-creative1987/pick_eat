class DashboardController < ApplicationController


  def my_restaurants
    @user = current_user
    @restaurants = @user.restaurants
  end


end



