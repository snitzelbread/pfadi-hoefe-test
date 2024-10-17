class CreateSponsors < ActiveRecord::Migration[7.2]
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :linky

      t.timestamps
    end
  end
end
