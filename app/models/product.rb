class Product < ApplicationRecord
    belongs_to :cook
    has_many :orders, as: :orderable
    has_many :reviews, as: :reviewable
    validates :name, presence: true,length: { maximum: 45 }
    validates :cost, presence: true
end
