class ChangeAvailabilitiesToEvents < ActiveRecord::Migration[6.1]
  def change
    rename_table :availabilities, :events
  end
end
