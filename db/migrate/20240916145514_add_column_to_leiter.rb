class AddColumnToLeiter < ActiveRecord::Migration[7.2]
  def change
    add_column :leiters, :image, :string
  end
end
