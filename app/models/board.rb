class Board < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :address, :style, :size, :year, :price_per_day, presence: true
  validates :photo, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..5.megabytes }

  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  has_one_attached :photo
end
