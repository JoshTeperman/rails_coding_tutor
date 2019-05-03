class RenameReviewerToReviewerId < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :reviewer, :reviewer_id
  end
end
