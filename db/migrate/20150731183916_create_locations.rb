class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.boolean :is_starting_point
      t.integer :user_id
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :distance_id
      t.references :distance 	

      t.timestamps null: false
    end
  end
end
