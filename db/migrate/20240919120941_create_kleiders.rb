class CreateKleiders < ActiveRecord::Migration[7.2]
  def change
    create_table :kleiders do |t|
      t.string :name
      t.string :description
      t.string :image
      t.decimal :price
      t.string :size

      t.timestamps
    end
  end
end
