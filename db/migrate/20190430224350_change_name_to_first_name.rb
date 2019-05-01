class ChangeNameToFirstName < ActiveRecord::Migration[5.2]
  def change
    rename_column :profiles, :name, :first_name
  end
end
