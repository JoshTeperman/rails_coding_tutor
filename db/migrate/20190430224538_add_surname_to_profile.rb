class AddSurnameToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :surname, :string
  end
end
