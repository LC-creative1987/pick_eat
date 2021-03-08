class DishIngredient < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient

  validates_presence_of :base_quantity, :min_quantity, :max_quantity
end
