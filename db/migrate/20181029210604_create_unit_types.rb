class CreateUnitTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :unit_types do |t|
      t.string :value, null:false
      t.boolean :active, null: false, default: true
      t.integer :order, null: false, default: 0
      t.string :updated_by
      t.timestamps
    end
  end
end
