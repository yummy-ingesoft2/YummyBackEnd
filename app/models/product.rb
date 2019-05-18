class Product < ApplicationRecord
    belongs_to :cook
    has_many :orders, as: :orderable
    has_many :reviews, as: :reviewable
end
