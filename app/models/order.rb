class Order < ApplicationRecord
    belongs_to :orderable , polymorphic: true
    validates :state, presence: true
    validates :quantity, presence: true,length: { maximum: 15 }
    validates :cost, presence: true
    validates :order_date, presence: true
end
