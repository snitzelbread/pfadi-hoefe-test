class AddLeaderToArticles < ActiveRecord::Migration[7.2]
  def change
    add_reference :articles, :leader, null: false, foreign_key: true
  end
end
