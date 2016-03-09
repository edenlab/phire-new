class Photo < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  validates :user_id, :name, :specialty, presence: :true

  # scope :specialty, -> { where(specialty: specialty) }
  # scope :location, -> { where(photographer_id.location: photographer_id.location) }
end
