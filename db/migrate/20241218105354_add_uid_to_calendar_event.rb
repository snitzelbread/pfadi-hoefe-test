class AddUidToCalendarEvent < ActiveRecord::Migration[7.2]
  def change
    add_column :calendar_events, :uid, :string, null: false
    remove_column :calendar_events, :calendar_name
  end
end
