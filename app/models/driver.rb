class Driver < ApplicationRecord
    has_many :orders
    validates :user, presence: true
    validates :password, presence: true
end
