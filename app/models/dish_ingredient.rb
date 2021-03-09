class DishIngredient < ApplicationRecord
  belongs_to :dish, foreign_key: true
  belongs_to :ingredient, foreign_key: true

  validates_presence_of :base_quantity, :min_quantity, :max_quantity
end
