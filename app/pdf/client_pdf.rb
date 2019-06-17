class ClientPdf < Prawn::Document
    def initialize(client)
        super()
        @client = client
        client_number
        client_data
    end
    
    def client_number
        text "Client \##{@client.id}", size: 20
    end
    
    def client_data
        move_down 20
        table([ ["Nombre", "Direccion","Correo"],
        ["#{@client.name}", "#{@client.address}","#{@client.email}"] ]) do
        self.header = true
        self.row_colors = ["DDDDDD","FFFFFF"]
    end
    end
end