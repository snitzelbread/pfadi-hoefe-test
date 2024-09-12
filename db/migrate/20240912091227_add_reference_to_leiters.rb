class AddReferenceToLeiters < ActiveRecord::Migration[7.2]
  def change
    add_reference :leiters, :hocks, index: true
  end
end
