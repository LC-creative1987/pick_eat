class Order < ApplicationRecord
  belongs_to :user
  has_many :dishes
  has_many :customized_items, through: :order_items
  has_many :order_items
end
