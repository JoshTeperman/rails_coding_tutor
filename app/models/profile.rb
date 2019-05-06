require 'pry'

class Profile < ApplicationRecord
  belongs_to :user

  before_create :set_tutor_id
  has_one_attached :avatar



  # validates :tutor?, :first_name, :surname, :skills, presence: true

  private
    def set_tutor_id
      if Profile.count == 0
        last_tutor_id = 1 
      else
        last_tutor_id = Profile.maximum(:tutor_id)
      end
      self.tutor_id = last_tutor_id.to_i + 1
    end


end
