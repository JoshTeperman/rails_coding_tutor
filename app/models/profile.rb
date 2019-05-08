require 'pry'

class Profile < ApplicationRecord
  belongs_to :user
  validates :hourly_rate, numericality: { greater_than: 0 }


  before_create :set_tutor_id
  has_one_attached :avatar

  def update_average_rating
    calc_average_rating
  end


  private
    def set_tutor_id
      if Profile.count == 0
        last_tutor_id = 1 
      else
        last_tutor_id = Profile.maximum(:tutor_id)
      end
      self.tutor_id = last_tutor_id.to_i + 1
    end

    def calc_average_rating
      tutor = User.find(self.user_id)
      total_reviews = tutor.reviews.count
      total = 0
      tutor.reviews.each { |review| total += review.rating }

      self.average_rating = 0 if tutor.reviews.count == 0
      self.average_rating = (total.to_f / total_reviews).round(1)
      self.save
    end

end
