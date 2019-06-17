class CookPdf < Prawn::Document
    def initialize(cook)
        super()
        @cook = cook
        cook_number
        cook_data
    end
    
    def cook_number
        text "Cook \##{@cook.id}", size: 18
    end
    
    def cook_data
        move_down 20
        #text "Cook #{@cook.name}"
        #table ["Nombre: ",@cook.name]["Telefono: ",@cook.tel]
    end
end