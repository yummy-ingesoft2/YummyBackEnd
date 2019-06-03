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

class Review < ApplicationRecord
    belongs_to :client
    belongs_to :product
    validates :qualification, presence: true
    validates :content, presence: true,length: { maximum: 500 }
    
end
