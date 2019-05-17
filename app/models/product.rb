class Product < ApplicationRecord
    belongs_to :cook
    has_many :orders
    has_many :reviews
end
