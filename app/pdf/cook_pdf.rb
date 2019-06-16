class CookPdf < Prawn::Document
    def initialize(cook)
        super()
        @cook = cook
        cook_number
        cook_data
    end
    
    def cook_number
        text "Cook \##{@cook.id}", size: 18, style: bold
    end
    
    def cook_data
        move_down 20
        table ["Nombre: ",@cook.name]["Telefono: ",@cook.tel]
    end
end