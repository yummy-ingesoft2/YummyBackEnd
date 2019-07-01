# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  order_date :date
#  state      :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  client_id  :integer
#  driver_id  :integer
#
# Indexes
#
#  index_orders_on_client_id  (client_id)
#  index_orders_on_driver_id  (driver_id)
#

class OrderSerializer < ActiveModel::Serializer
  attributes  :order_date, :state ,:id
  #def product
  #  {id: self.object.product_id,
  #  quantity: self.object.quantity,
  #  cost:self.object.cost
  #  }
  #end 
  #has_one :client
  #has_one :driver
end
