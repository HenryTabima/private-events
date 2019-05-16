class AddEventDateToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :event_date, :dateTime
  end
end
