class AddRenrenUrlToUser < ActiveRecord::Migration
  def change
    add_column :users, :renren_url, :string
  end
end
