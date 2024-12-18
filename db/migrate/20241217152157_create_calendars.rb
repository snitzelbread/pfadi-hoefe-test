class CreateCalendars < ActiveRecord::Migration[7.2]
  def change
    create_table :calendars do |t|
      t.string :name
      t.string :url
      t.datetime :last_synced_at

      t.timestamps
    end
  end
end
