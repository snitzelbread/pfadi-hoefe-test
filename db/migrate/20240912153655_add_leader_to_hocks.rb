class AddLeaderToHocks < ActiveRecord::Migration[6.1]
  def change
    add_reference :hocks, :leader, null: false, foreign_key: true
  end
end
