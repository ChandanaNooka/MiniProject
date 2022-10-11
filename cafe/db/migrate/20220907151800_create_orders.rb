class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :date
      t.bigint :user_id

      t.timestamps null: false
    end
  end
end
