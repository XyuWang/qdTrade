class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.integer :school_id, null: false
      t.integer :type_id, null: false
      t.integer :category_id, null: false
      t.string :title, null:false
      t.text :content
      t.string :contact, null: false
      t.decimal :price, null:false, default: 0, scale: 2, precision: 8
      t.integer :status
      t.timestamps
    end

    add_index :posts, :school_id
    add_index :posts, :type_id
    add_index :posts, :category_id
    add_index :posts, :status
  end
end
