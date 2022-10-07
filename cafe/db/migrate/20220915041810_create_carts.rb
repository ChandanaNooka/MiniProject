class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :menu_category_name
      t.integer :menu_item_id
      t.string :menu_item_name
      t.decimal :menu_item_price

      t.timestamps null: false
    end
  end
end
