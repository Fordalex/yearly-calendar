class AddColorToEventType < ActiveRecord::Migration[6.1]
  def change
    add_column :event_types, :colour, :string
  end
end
