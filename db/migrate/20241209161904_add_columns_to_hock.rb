class AddColumnsToHock < ActiveRecord::Migration[7.2]
  def change
    add_column :hocks, :end_time, :datetime
  end
end
