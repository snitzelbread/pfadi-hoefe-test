class CreateLeiters < ActiveRecord::Migration[7.2]
  def change
  create_table :leiters do |t|
      t.string :pfadiname
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password_digest
      t.string :stufe
      t.string :funktion

      t.timestamps
      end
  end
end
