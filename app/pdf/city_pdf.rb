class CityPdf < Prawn::Document
    def initialize(city)
        super()
        @city = city
        city_number
        city_data
    end
    
    def city_number
        text "City \##{@city.id}", size: 18
    end
    
    def city_data
        move_down 20
        text "City #{@city.name}"
        #table ["Nombre: ",@city.name]["Telefono: ",@city.tel]
    end
end