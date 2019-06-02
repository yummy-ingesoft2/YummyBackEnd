# == Schema Information
#
# Table name: reviews
#
#  id              :integer          not null, primary key
#  content         :text
#  qualification   :integer
#  reviewable_type :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  client_id       :integer
#  product_id      :integer
#  reviewable_id   :integer
#
# Indexes
#
#  index_reviews_on_client_id                          (client_id)
#  index_reviews_on_product_id                         (product_id)
#  index_reviews_on_reviewable_

class ReviewSerializer < ActiveModel::Serializer
  attributes :content, :qualification
end
