class RemoveType < ActiveRecord::Migration
  def change
    remove_column :posts, :type_id

    drop_table :types
  end
end
