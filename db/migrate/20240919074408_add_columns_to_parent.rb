class AddColumnsToParent < ActiveRecord::Migration[7.2]
  def change
    add_column :parents, :email, :string
    add_column :parents, :password_digest, :string
  end
end
