class CreateCamps < ActiveRecord::Migration[7.2]
  def change
    create_table :camps do |t|
      t.string :name
      t.string :general_description
      t.string :quote
      t.string :template
      t.string :this_camp_description

      t.timestamps
    end
  end
end
