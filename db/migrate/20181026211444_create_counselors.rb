class CreateCounselors < ActiveRecord::Migration[5.2]
  def change
    create_table :counselors do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :unit_number
      t.boolean :help_others
      t.date :ypt
      t.string :status
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
