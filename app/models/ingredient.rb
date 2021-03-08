class Ingredient < ApplicationRecord
  belongs_to :restaurant
  has_many :dish_ingredients

  validates_presence_of :name, :unit, :increment, :cost, :price
end
