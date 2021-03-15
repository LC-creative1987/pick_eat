class SpecialRequest < ApplicationRecord
  belongs_to :ingredient
  belongs_to :order_item

  def item_price
    (self.quantity/self.ingredient.change_increment) * self.ingredient.price
  end
end
