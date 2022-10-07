class AddCartIdToCart < ActiveRecord::Migration
  def change
    add_reference :carts, :cart, index: true, foreign_key: true
  end
end
