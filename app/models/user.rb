class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD

  has_many :boards
  has_many :bookings
=======
  has_many :boards
  has_many :bookings
  validates :name, :age, presence: true
>>>>>>> 139d140c006b6e2af88efedfe67707e44546f574
end
