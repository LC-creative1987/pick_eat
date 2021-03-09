class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :restaurants, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates_presence_of :first_name, :last_name, :address, :phone_number, :email
  validates_uniqueness_of :email
end
