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
#  index_reviews_on_reviewable_type_and_reviewable_id  (reviewable_type,reviewable_id)
#

class Review < ApplicationRecord
    belongs_to :client
    belongs_to :product
    validates :qualification, presence: true
    validates :content, presence: true,length: { maximum: 500 }
    
    def self.get_reviews_info(product_id, page)
        self.where("product_id = ?",product_id).paginate(page: page, per_page: 10).pluck(:qualification,:content)
    end
    
    def self.get_review(product_id, id)
        self.where("product_id = ? and id = ?",product_id, id)
    end
end
