class AddUnitTypeToCounselor < ActiveRecord::Migration[5.2]
  def change
    add_reference :counselors, :unit_type, index: true
    add_foreign_key :counselors, :unit_types
  end
end
