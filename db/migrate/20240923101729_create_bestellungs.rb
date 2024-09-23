class CreateBestellungs < ActiveRecord::Migration[7.2]
  def change
    create_table :bestellungs do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :address
      t.string :city
      t.string :zipcode
      t.string :message
      t.string :order_list

      t.timestamps
    end
  end
end
