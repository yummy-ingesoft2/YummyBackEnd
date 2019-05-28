# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  orderable_type :string
#  orderable_id   :integer
#  state          :boolean
#  quantity       :integer
#  cost           :integer
#  order_date     :date
#  client_id      :integer
#  product_id     :integer
#  driver_id      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
