class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable#, :confirmable

  has_many :user_bookings, dependent: :delete_all
  has_many :bookings, through: :user_bookings, dependent: :delete_all
  has_one :profile, dependent: :delete
  has_many :reviews, dependent: :delete_all
  has_and_belongs_to_many :orders

end
