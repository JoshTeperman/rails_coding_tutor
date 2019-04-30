class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_bookings
  has_many :bookings, through: :user_bookings
  has_one :profile
  has_many :reviews
  has_and_belongs_to_many :orders


end
