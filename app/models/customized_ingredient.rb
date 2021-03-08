class CustomizedIngredient < ApplicationRecord
  belongs_to :dish_ingredient
  belongs_to :order_item
end
