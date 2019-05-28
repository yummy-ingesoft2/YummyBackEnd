# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  category    :string
#  name        :string
#  description :text
#  cost        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cook_id     :integer
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
