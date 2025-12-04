class CreateReservations < ActiveRecord::Migration[7.2]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :room_id
      t.date :check_in
      t.date :check_out
      t.integer :guest_count

      t.timestamps
    end
  end
end
