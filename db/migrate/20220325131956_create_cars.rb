class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :brand 
      t.string :model
      t.integer :model_year
      t.string :photo_url
      t.text :description
      t.boolean :reserved ,default: false
      t.decimal :rent_fee
      t.integer :likes_counter ,default: 0
      t.integer :reservation_counter ,default: 0

      t.timestamps
    end
  end
end
