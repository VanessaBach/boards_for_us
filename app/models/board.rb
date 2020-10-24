class Board < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :type, :size, :year, :price_per_day, presence: true
end
