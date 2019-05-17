class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.boolean :state
      t.integer :quantity
      t.integer :cost
      t.date :order_date

      t.timestamps
    end
  end
end
