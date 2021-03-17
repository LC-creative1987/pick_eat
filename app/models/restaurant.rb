class Restaurant < ApplicationRecord
  CUISINES = ["Lebanese", "Indian", "Italian", "Thai", "Chinese", "French", "Azerbaijani", "Moroccan", "International", "Brasilian", "British", "Russian", "Asian", "Spanish", "Portoguese", "Japanese", "Mexican", "Arabic"]
  belongs_to :user
  has_many :dishes, dependent: :destroy
  has_many :ingredients, dependent: :destroy

  validates_presence_of :name, :address, :phone_number, :cuisine
  validates :name, uniqueness: true
  validates :cuisine, inclusion: { in: CUISINES }
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def show_distance
    distance([25.102980004648156, 55.16300169747915], [self.latitude, self.longitude])
  end

  def distance(loc1, loc2)
    rad_per_deg = Math::PI / 180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters

    dlat_rad = (loc2[0] - loc1[0]) * rad_per_deg # Delta, converted to rad
    dlon_rad = (loc2[1] - loc1[1]) * rad_per_deg

    lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    (rm * c / 1000).round # Delta in km
  end


end
