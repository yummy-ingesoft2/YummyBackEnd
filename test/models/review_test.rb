# == Schema Information
#
# Table name: reviews
#
#  id            :integer          not null, primary key
#  content       :text
#  qualification :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  client_id     :integer
#  product_id    :integer
#
# Indexes
#
#  index_reviews_on_client_id   (client_id)
#  index_reviews_on_product_id  (product_id)
#

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
