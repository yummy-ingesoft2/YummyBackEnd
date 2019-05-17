class Order < 
    belongs_to :product
    belongs_to :driver
    belongs_to :client
end
