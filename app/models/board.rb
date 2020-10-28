class Board < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  validates :style, :size, :year, :price_per_day, presence: true
end
