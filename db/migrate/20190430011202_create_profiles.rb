class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.boolean :tutor?
      t.boolean :admin?
      t.string :name
      t.string :skills
      t.string :bio
      t.integer :average_rating
      t.integer :hourly_rate
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
