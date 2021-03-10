class Dish < ApplicationRecord

  belongs_to :restaurant
  has_many :dish_ingredients, dependent: :destroy
  has_many :ingredients, through: :dish_ingredients
  accepts_nested_attributes_for :dish_ingredients

  validates_presence_of :name, :base_price
end
