class ChangeRoleDataTypes < ActiveRecord::Migration[5.2]
  def change
    change_table :roles do |t|
      t.change :permission_create, :string, default: "default", null: false
      t.change :permission_view, :string, default: "default", null: false
      t.change :permission_update, :string, default: "default", null: false
      t.change :permission_delete, :string, default: "restricted", null: false
      t.change :permission_send_notifications, :string, default: "restricted", null: false
      t.change :active, :boolean, default: false, null: false
    end
  end
end
