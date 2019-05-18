class Order < ApplicationRecord
    belongs_to :product
    belongs_to :driver
    belongs_to :client
    validates :state, inclusion: { in: [true, false] }
    validates :quantity, presence: true
    validates :cost, presence: true
    validates :order_date, presence: true
end
