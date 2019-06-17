class CookPdf < Prawn::Document
    def initialize(cook)
        super()
        @cook = cook
        cook_number
        cook_data
    end
    
    def cook_number
        text "Cook \##{@cook.id}", size: 20
    end
    
    def cook_data
        move_down 20
        #text "Cook #{@cook.name}"
        table([ ["Nombre", "Telefono","Correo"],
        ["#{@cook.name}", "#{@cook.tel}","#{@cook.email}"] ]) do
        self.header = true
        self.row_colors = ["DDDDDD","FFFFFF"]
    end
    end
end