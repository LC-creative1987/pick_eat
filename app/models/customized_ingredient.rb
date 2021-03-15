class CustomizedIngredient < ApplicationRecord
  belongs_to :dish_ingredient
  belongs_to :order_item
  validates :quantity, numericality: { only_integer: true }

  # before_validation :quantity_range, on: :create

  def item_price
    (self.quantity/self.dish_ingredient.ingredient.change_increment) * self.dish_ingredient.ingredient.price
  end

  def can_increase?
    self.quantity + self.dish_ingredient.ingredient.change_increment <= self.dish_ingredient.max_quantity
  end

  def can_decrease?
    self.quantity - self.dish_ingredient.ingredient.change_increment >= self.dish_ingredient.min_quantity
  end


  private
  # def quantity_range
  #   if self.quantity > dish_ingredient.max_quantity || self.quantity < dish_ingredient.min_quantity
  #     fail "Quantity should be less than maximum or more than minimum for the Dish"
  #   end
  # end


end
