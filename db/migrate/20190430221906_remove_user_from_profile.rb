class RemoveUserFromProfile < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :admin?, :boolean
  end
end
