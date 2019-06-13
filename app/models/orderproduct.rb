# == Schema Information
#
# Table name: orderproducts
#
#  id         :integer          not null, primary key
#  cost       :integer
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :integer
#  product_id :integer
#
# Indexes
#
#  index_orderproducts_on_order_id    (order_id)
#  index_orderproducts_on_product_id  (product_id)
#

class Orderproduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates :quantity, presence: true,length: { maximum: 15 }
  def self.cost ()
       self.joins(:product).where('products.id = 805')
  end
end
