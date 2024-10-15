class AddLeaderToCamps < ActiveRecord::Migration[7.2]
  def change
    add_reference :camps, :leader, null: false, foreign_key: true
  end
end
