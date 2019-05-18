class Order < 
    belongs_to :orderable , polymorphic: true
    validates :state, presence: true
    validates :quantity, presence: true
    validates :cost, presence: true
    validates :order_date, presence: true
end
