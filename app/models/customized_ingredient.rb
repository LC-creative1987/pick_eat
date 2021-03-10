class CustomizedIngredient < ApplicationRecord
  belongs_to :dish_ingredient
  belongs_to :order_item
  validates :quantity, numericality: { only_integer: true }
  
  # before_validation :quantity_range, on: :create

  private
  # def quantity_range
  #   if customized_ingredient.quantity > dish_ingredient.max_quantity || customized_ingredient.quantity < dish_ingredient.min_quantity
  #     fail "Quantity should be less than maximum or more than minimum for the Dish"
  #   end
  # end
end
