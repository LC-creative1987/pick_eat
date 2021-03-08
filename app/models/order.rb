class Order < ApplicationRecord
  belongs_to :user
  has_many :dishes, through: :order_items
  validates_presence_of :delivery_address
end
