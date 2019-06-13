class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.boolean :state
      t.date :order_date
      t.belongs_to :client, index: true
      t.belongs_to :driver, index: true
      t.timestamps
    end
  end
end
