class SpecialRequestsController < ApplicationController

  def create
    @special_request = SpecialRequest.new(special_requests_params)
    @order_item = OrderItem.find(params[:order_item_id])
    @special_request.order_item = @order_item

    @ingredient = Ingredient.find(params[:special_request][:ingredient])
    @special_request.ingredient = @ingredient
    @special_request.quantity = @ingredient.change_increment
    @special_request.save
    redirect_to order_item_path(@order_item, anchor: "special_request-#{@special_request.id}")
  end

  def destroy
    @special_request = SpecialRequest.find(params[:order_item_id])
    @special_request.destroy

    redirect_to order_item_path(@special_request.order_item)
  end

  def increase_amount
    @special_request = SpecialRequest.find(params[:special_request_id])
    @ingredient = @special_request.ingredient

    if @special_request.quantity + @ingredient.change_increment <= 4 * @ingredient.change_increment
      @special_request.quantity += @ingredient.change_increment
      @special_request.save
      respond_to do |format|
        format.html { redirect_to order_item_path(@special_request.order_item) }
        format.js { render partial: "change_amount" }
      end
    else
      respond_to do |format|
        format.html { redirect_to order_item_path(@special_request.order_item) }
        format.js { render partial: "error" }
      end
    end
  end

  def decrease_amount
    @special_request = SpecialRequest.find(params[:special_request_id])
    @ingredient = @special_request.ingredient

    if @special_request.quantity - @ingredient.change_increment >= 0
      @special_request.quantity -= @ingredient.change_increment
      @special_request.save
      respond_to do |format|
        format.html { redirect_to order_item_path(@special_request.order_item) }
        format.js { render partial: "change_amount" }
      end
    else
      respond_to do |format|
        format.html { redirect_to order_item_path(@special_request.order_item) }
        format.js { render partial: "error" }
      end
    end
  end

  private

  def special_requests_params
    params.require(:special_request).permit(:min_quantity, :max_quantity, :base_quantity)
  end
end
