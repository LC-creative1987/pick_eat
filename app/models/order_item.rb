class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :dish
  has_many :customized_ingredients, dependent: :destroy
  has_many :special_requests, dependent: :destroy
  # validates_presence_of :quantity
  # validates :quantity, numericality: { only_integer: true }
end
