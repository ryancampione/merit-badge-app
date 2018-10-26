class AddMeritBadgeImg < ActiveRecord::Migration[5.2]
  def change
    add_column :merit_badges, :img_url, :string
  end
end
