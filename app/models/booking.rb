class Booking < ActiveRecord::Base
  extend Enumerize

  enumerize :status, in: [:pending, :accepted, :declined]

  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :photographer, class_name:'User', foreign_key: 'photographer_id'

  validates :date, :user_id, :photographer_id, :message, presence: :true
end
