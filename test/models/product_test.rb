# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  category    :string
#  cost        :integer
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cook_id     :integer
#
# Indexes
#
#  index_products_on_cook_id  (cook_id)
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
