class Restaurant < ApplicationRecord
  CUISINES = ["Lebanese", "Indian", "Italian", "Thai", "Chinese", "French"]
  belongs_to :user
  has_many :dishes, dependent: :destroy
  has_many :ingredients, dependent: :destroy

  validates_presence_of :name, :address, :phone_number, :cuisine
  validates :name, uniqueness: true
  validates :cuisine, inclusion: { in: CUISINES }
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
