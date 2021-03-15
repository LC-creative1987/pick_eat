class Ingredient < ApplicationRecord
  belongs_to :restaurant
  has_many :dish_ingredients, dependent: :destroy
  has_many :special_requests, dependent: :destroy

  validates_presence_of :name, :unit, :change_increment, :cost, :price, :stock_quantity
end
