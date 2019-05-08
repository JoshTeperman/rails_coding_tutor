class Review < ApplicationRecord
  belongs_to :user

  validates :rating, :content, presence: true
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }


  private     
    def average_rating_for_tutor(tutor)
    #input --> all review ratings for user
    # divide 
    end
end
