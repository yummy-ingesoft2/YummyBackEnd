# == Schema Information
#
# Table name: reviews
#
#  id              :integer          not null, primary key
#  reviewable_type :string
#  reviewable_id   :integer
#  qualification   :integer
#  content         :text
#  client_id       :integer
#  product_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Review < ApplicationRecord
    validates :qualification, presence: true
    validates :content, presence: true,length: { maximum: 500 }
    belongs_to :reviewable, polymorphic: true
end
