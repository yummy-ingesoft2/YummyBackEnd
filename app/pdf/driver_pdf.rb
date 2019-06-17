class DriverPdf < Prawn::Document
    def initialize(driver)
        super()
        @driver = driver
        driver_number
        driver_data
    end
    
    def driver_number
        text "Driver \##{@driver.id}", size: 20
    end
    
    def driver_data
        move_down 20
        table([ ["Nombre","Correo"],
        ["#{@driver.name}","#{@driver.email}"] ]) do
        self.header = true
        self.row_colors = ["DDDDDD","FFFFFF"]
    end
    end
end