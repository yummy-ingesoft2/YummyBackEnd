class CreateOrderproducts < ActiveRecord::Migration[5.2]
  def change
    create_table :orderproducts do |t|
      t.integer :quantity
      t.integer :cost
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
