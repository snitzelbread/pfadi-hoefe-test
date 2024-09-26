class AddReferenceToBestellung < ActiveRecord::Migration[7.2]
  def change
    add_reference :bestellungs, :kleiders, index: true
  end
end
