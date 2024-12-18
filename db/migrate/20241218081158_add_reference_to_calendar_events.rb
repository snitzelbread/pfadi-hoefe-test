class AddReferenceToCalendarEvents < ActiveRecord::Migration[7.2]
  def change
    add_reference :calendar_events, :calendar, null: false, foreign_key: true
  end
end
