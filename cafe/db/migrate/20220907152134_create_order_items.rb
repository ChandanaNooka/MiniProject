class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.bigint :order_id
      t.integer :menu_item_id
      t.string :menu_item_name
      t.decimal :menu_item_price

      t.timestamps null: false
    end
  end
end
