class AddHitsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :hits, :integer, default: 0, null: false
  end
end
