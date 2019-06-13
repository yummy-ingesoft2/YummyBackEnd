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

class Order < ApplicationRecord
    belongs_to :client
    belongs_to :driver
    has_many :order_products
    has_many :products, through: :order_products
    #validates :state, presence: true
    validates :order_date, presence: true
end
