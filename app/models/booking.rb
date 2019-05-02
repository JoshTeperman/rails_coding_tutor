class Booking < ApplicationRecord

  has_many :user_bookings, dependent: :delete_all
  has_many :users, through: :user_bookings

end
