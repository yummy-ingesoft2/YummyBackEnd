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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
