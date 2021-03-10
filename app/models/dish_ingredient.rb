class DishIngredient < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient
  has_many :customized_ingredients, dependent: :destroy

  validates_presence_of :base_quantity, :min_quantity, :max_quantity
end
