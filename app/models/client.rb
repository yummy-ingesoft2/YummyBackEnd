class Client < ApplicationRecord
    belongs_to :city
    has_many :reviews, as: :reviewable
    has_many :orders

end
