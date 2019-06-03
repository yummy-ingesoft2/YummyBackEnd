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

class ReviewSerializer < ActiveModel::Serializer
  attributes :content, :qualification, :client
def client
  { 
     client: self.object.client.user}
end

end
