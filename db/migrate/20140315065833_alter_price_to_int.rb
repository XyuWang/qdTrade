class AleterPriceToInt < ActiveRecord::Migration
  def change
    change_column :posts, :price, :integer, null: false, default: 0
  end
end
