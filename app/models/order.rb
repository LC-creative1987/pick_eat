class Order < ApplicationRecord
  belongs_to :user, foreign_key: true
  has_many :dishes, through: :order_items
  has_many :customized_items, through: :order_items
end
