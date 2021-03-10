class Order < ApplicationRecord
  belongs_to :user
  has_many :dishes
  has_many :customized_items, through: :order_items
  validates_presence_of :delivery_address
end
