class CreateHocks < ActiveRecord::Migration[7.2]
  def change
    create_table :hocks do |t|
      t.belongs_to :leiter
      t.string :title
      t.string :description
      t.string :ort
      t.datetime :datetime
      t.string :stufe

      t.timestamps
    end
  end
end