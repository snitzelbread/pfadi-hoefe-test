class AddColumnToCalendar < ActiveRecord::Migration[7.2]
  def change
    add_column :calendars, :color, :string
    remove_column :calendar_events, :color
  end
end
