class AddPublicToPost < ActiveRecord::Migration
  def change
    remove_column :posts, :status

    add_column :posts, :public, :boolean, default: true
    add_index :posts, :public
  end
end
