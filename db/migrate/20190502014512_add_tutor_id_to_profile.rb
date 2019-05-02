class AddTutorIdToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :tutor_id, :integer, unique: true, null: false
  end
end
