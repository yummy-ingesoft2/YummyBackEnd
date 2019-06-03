# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  cost           :integer
#  order_date     :date
#  orderable_type :string
#  quantity       :integer
#  state          :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  client_id      :integer
#  driver_id      :integer
#  orderable_id   :integer
#  product_id     :integer
#
# Indexes
#
#  index_orders_on_client_id                        (client_id)
#  index_orders_on_driver_id                        (driver_id)
#  index_orders_on_orderable_type_and_orderable_id  (orderable_type,orderable_id)
#  index_orders_on_product_id                       (product_id)
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
