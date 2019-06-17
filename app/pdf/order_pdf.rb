class OrderPdf < Prawn::Document
    def initialize(order)
        super()
        @order = order
        order_number
        order_data
    end
    
    def order_number
        text "Order \##{@order.id}", size: 20
    end
    
    def order_data
        move_down 20
        table([ ["id del cliente", "estado", "precio"],
        ["#{@order.client_id}", "#{@order.state}"] ]) do
        self.header = true
        self.row_colors = ["DDDDDD","FFFFFF"]
    end
    end
end