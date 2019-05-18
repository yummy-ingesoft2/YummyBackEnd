class Review < ApplicationRecord
    validates :qualification, presence: true
    validates :content, presence: true,length: { maximum: 500 }
    belongs_to :reviewable, polymorphic: true
end
