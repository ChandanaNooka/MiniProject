class AddOrderstatusToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :orderstatus, :datetime
  end
end
