class AddSalesCountToMenuitems < ActiveRecord::Migration
  def change
    add_column :menu_items, :sales_count, :integer, null: false, default: 0
  end
end
