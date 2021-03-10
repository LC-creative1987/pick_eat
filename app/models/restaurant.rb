class Restaurant < ApplicationRecord
  has_one_attached :photo
  CUISINES = ["Lebanese", "Indian", "Italian", "Thai", "Chinese", "French"]
  belongs_to :user, foreign_key: true
  has_many :dishes, dependent: :destroy
  has_many :ingredients, dependent: :destroy

  validates_presence_of :name, :address, :phone_number, :cuisine
  validates :name, uniqueness: true
  validates :cuisine, inclusion: { in: CUISINES }
end
