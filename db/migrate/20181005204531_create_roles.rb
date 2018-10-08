class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :title
      t.text :description
      t.string :permission_create
      t.string :permission_view
      t.string :permission_update
      t.string :permission_delete
      t.string :permission_send_notifications
      t.boolean :default
      t.boolean :active
      t.timestamps
    end
  end
end
