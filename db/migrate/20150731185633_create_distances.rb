class CreateDistances < ActiveRecord::Migration
  def change
    create_table :distances do |t|

      t.integer :user_id
      t.float :distance_in_km
      t.timestamps null: false
    end
  end
end
