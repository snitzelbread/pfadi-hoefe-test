class CreateCalendarEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :calendar_events do |t|
      t.string :title
      t.string :location
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.string :color
      t.string :calendar_name

      t.timestamps
    end
  end
end
