class CityPdf < Prawn::Document
    def initialize(city)
        super()
        @city = city
        city_number
        city_data
    end
    
    def city_number
        text "City \##{@city.id}", size: 20
    end
    
    def city_data
        move_down 20
        text "City name: #{@city.name}"
    end
end