class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :dishes
  has_many :ingredients

  validates_presence_of :name, :address, :phone_number, :cuisine
  validates :name, uniqueness: true
end
