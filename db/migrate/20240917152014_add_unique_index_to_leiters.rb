class AddUniqueIndexToLeiters < ActiveRecord::Migration[7.2]
  def change
    add_index :leiters, [ :stufe, :funktion ], unique: true
  end
end
