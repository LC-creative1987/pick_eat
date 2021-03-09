class OrderItem < ApplicationRecord
  belongs_to :order, foreign_key: true
  belongs_to :dish, foreign_key: true
  validates_presence_of :quantity
  validates :quantity, numericality: { only_integer: true }
end
