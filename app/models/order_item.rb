class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :dish
  validates_presence_of :quantity
  validates :quantity, numericality: { only_integer: true }
end
