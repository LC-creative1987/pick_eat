class Ingredient < ApplicationRecord

  belongs_to :restaurant
  has_many :dish_ingredients, dependent: :destroy

  validates_presence_of :name, :unit, :change_increment, :cost, :price
end
