class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :orderable, polymorphic: true
      t.boolean :state
      t.integer :quantity
      t.integer :cost
      t.date :order_date
      t.belongs_to :client, index: true
      t.belongs_to :product, index: true
      t.belongs_to :driver, index: true

      t.timestamps
    end
  end
end
