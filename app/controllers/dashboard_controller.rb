class DashboardController < ApplicationController


  def my_restaurants
    @user = current_user
    @restaurants = @user.restaurants
  end

  def edit_stock
    @user = current_user


    @restaurants = @user.restaurants

  end


  def update_stock

    result = Ingredient.update(params[:ingredients].keys, params[:ingredients].values).reject { |p| p.errors.empty? }
    if result.empty?
      flash[:notice] = "Ingredients updated"
      redirect_to edit_stock_path(page: params[:page])
    else
      ingredient_ids = result.collect {|i| i.id}
      flash[:error] = "Error(s) occurred updating ingredients(s): #{ingredient_ids.join ', '}"
      redirect_to edit_stock_path(page: params[:page])
    end

  end


end



