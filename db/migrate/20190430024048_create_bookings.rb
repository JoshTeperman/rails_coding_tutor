class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.timestamp :date
      t.string :location
      t.integer :price
      t.integer :duration

      t.timestamps
    end
  end
end
