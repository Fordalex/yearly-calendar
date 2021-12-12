class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.text :name
      t.datetime :est_time
      t.decimal :cost, precision: 10, scale: 2
      t.decimal :deposit, precision: 10, scale: 2

      t.timestamps
    end
  end
end
