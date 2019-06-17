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
    has_many :orderproducts , dependent: :destroy 
    has_many :products, through: :orderproducts
    #validates :state, presence: true
    validates :order_date, presence: true

    def self.product(order_id)
        self.joins(:orderproducts).where("order_id = ?",order_id).select('orders.order_date,orders.state,orderproducts.*')
    end
    
end
