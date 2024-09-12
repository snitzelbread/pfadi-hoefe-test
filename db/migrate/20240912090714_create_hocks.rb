class CreateHocks < ActiveRecord::Migration[7.2]
  def change
    create_table :hocks do |t|
      t.belongs_to :leiter
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
