class Booking < ApplicationRecord

  has_many :user_bookings
  has_many :users, through: :user_bookings

end
