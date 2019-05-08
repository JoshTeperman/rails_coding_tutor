class Booking < ApplicationRecord

  has_many :user_bookings, dependent: :delete_all
  has_many :users, through: :user_bookings

  validates :date, :location, :price, :duration, presence: true
  validates :duration, inclusion: { in: [15, 30, 45, 60, 90, 120] }
  validates :location, inclusion: { in: ['Melbourne', 'Sydney', 'Adelaide', 'Brisbane', 'Canberra', 'Perth', 'Darwin', 'Hobart', 'Skype', 'Zoom']}

end