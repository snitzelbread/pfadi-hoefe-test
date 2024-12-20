class RemoveIndexOnStufeAndFunktionFromLeaders < ActiveRecord::Migration[6.1]
  def change
    remove_index :leaders, name: "index_leaders_on_stufe_and_funktion"
  end
end
