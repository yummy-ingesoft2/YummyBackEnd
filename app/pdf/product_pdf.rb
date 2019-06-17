class ProductPdf < Prawn::Document
    def initialize(product)
        super()
        @product = product
        product_number
        product_data
    end
    
    def product_number
        text "Product \##{@product.id}", size: 20
    end
    
    def product_data
        move_down 20
        table([ ["Categoria", "nombre","descripcion"],
        ["#{@product.category}", "#{@product.name}","#{@product.description}"] ]) do
        self.header = true
        self.row_colors = ["DDDDDD","FFFFFF"]
    end
    end
end