class Review < ApplicationRecord
  validates :qualification, presence: true
  validates :content, presence: true
  belongs_to :reviewable, polymorphic: true
end
