class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.integer :seminar_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
