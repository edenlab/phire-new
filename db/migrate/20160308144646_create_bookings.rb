class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.datetime :date
      t.string :status, default: "pending"
      t.string :message
      t.integer :user_id
      t.integer :photographer_id

      t.timestamps null: false
    end
  end
end
