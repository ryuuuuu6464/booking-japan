class CreateRooms < ActiveRecord::Migration[7.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :user_id
      t.integer :price_per_night
      t.string :address
      t.string :image
      t.text :introduction

      t.timestamps
    end
  end
end
