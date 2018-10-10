class CreateMeritBadge < ActiveRecord::Migration[5.2]
  def change
    create_table :merit_badges do |t|
      t.string :title
      t.boolean :eagle_required
      t.text  :special_counselor_requirements
      t.boolean :active
      t.timestamps
      t.string :updated_by
    end
  end
end
