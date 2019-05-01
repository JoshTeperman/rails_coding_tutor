class RemoveTutorIdFromUserBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_bookings, :tutor_id

  end
end
