class AddNicknameToUser < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string, null: false, default: "Anonymity"
  end
end
