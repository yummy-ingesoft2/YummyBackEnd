class Product < ApplicationRecord
    belongs_to :cook
    has_many :orders
    has_many :reviews
    validates :name, presence: true
    validates :cost, presence: true
end
