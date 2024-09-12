class AddLeiterToHocks < ActiveRecord::Migration[6.1]
  def change
    add_reference :hocks, :leiter, null: false, foreign_key: true
  end
end
