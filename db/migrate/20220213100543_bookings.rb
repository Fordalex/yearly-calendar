class Bookings < ActiveRecord::Migration[6.1]
  def change
    drop_table :bookings
  end
end
