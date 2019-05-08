class ChangeAverageRatingToBeFloatInProfiles < ActiveRecord::Migration[5.2]
  def change
    change_column :profiles, :average_rating, :float
  end
end