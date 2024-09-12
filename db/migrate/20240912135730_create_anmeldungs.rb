class CreateAnmeldungs < ActiveRecord::Migration[7.2]
  def change
    create_table :anmeldungs do |t|
      t.string :firstname
      t.string :lastname
      t.date :birthday
      t.string :email
      t.string :phone
      t.string :address
      t.string :place
      t.string :zipcode
      t.string :allergies
      t.string :stufe
      t.string :krankenkasse
      t.string :ahv_number
      t.boolean :rights_to_pictures
      t.string :message
      t.boolean :order_pfadikravatte

      t.timestamps
    end
  end
end
