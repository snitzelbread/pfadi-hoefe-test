class AddColumnToHocks < ActiveRecord::Migration[7.2]
  def change
    add_column :hocks, :ort, :string
  end
end
