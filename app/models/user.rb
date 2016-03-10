class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable


  has_many :photos, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :first_name, :last_name, :location, presence: :true
  
  geocoded_by :location
  after_validation :geocode, if: :location_changed?
end
