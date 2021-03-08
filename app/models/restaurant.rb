class Restaurant < ApplicationRecord
  CUISINES = ["Lebanese", "Indian", "Italian", "Thai", "Chinese", "French"]
  belongs_to :user
  has_many :dishes, dependent: :destroy
  has_many :ingredients, dependent: :destroy

  validates_presence_of :name, :address, :phone_number, :cuisine
  validates :name, uniqueness: true
  validates :cuisine, inclusion: { in: CUISINES }
end
