class Dish < ApplicationRecord
  belongs_to :restaurant
  has_many :dish_ingredients

  validates_presence_of :name, :base_price
end
