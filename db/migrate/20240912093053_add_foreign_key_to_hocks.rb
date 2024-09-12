class AddForeignKeyToHocks < ActiveRecord::Migration[7.2]
  def change
    change_table :hocks do |t|
      add_reference :hocks, :leiters, foreign_key: true
    end
    end
end
