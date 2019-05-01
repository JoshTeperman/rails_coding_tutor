class AddTutorIdToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :tutor_id, :integer
  end
end
