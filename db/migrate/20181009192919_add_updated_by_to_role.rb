class AddUpdatedByToRole < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :updated_by, :string
  end
end
