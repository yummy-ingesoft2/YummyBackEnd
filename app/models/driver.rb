class Driver < ApplicationRecord
    has_many :orders, as: :orderable
    validates :user, presence: true
    validates :password, presence: true
end
