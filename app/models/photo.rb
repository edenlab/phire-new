class Photo < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  validates :photographer_id, :name, :specialty, presence: :true
end
