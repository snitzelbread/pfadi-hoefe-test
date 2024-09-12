class AddColumnsHocks < ActiveRecord::Migration[7.2]
  def change
    add_column :hocks, "date", :datetime
    add_column :hocks, "stufe", :string
  end
end
