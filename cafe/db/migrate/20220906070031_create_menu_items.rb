class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.integer :menu_category_id
      t.string :name
      t.text :description
      t.decimal :price

      t.timestamps null: false
    end
  end
end
