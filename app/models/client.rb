class Client < ApplicationRecord
    belongs_to :city
    has_many :reviews
    has_many :orders
end
