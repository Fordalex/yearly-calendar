class CreateAvailabilities < ActiveRecord::Migration[6.1]
  def change
    create_table :availabilities do |t|
      t.datetime :start_time
      t.datetime :finish_time
      t.date :date

      t.timestamps
    end
  end
end
