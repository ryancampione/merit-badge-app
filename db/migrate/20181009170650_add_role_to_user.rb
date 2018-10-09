class AddRoleToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role_id, :integer
    add_column :users, :active, :boolean
  end
end
