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

class OrderproductSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :cost ,:costp
  has_one :order
  has_one :product
  def costp
    {costp: self.object.product.cost}
  end
end
