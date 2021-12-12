class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.text :description
      t.decimal :cost, precision: 10, scale: 2
      t.text :note
      t.datetime :start_time
      t.datetime :finish_time
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
