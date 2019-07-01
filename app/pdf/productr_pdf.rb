class ProductrPdf < Prawn::Document
    #require 'squid'
    def initialize(user)
        super()
        series = []
        ar=[]
        na=[]
        @user = user
        user_data
        @user.map do |user|
        ar.push(user.qualification)
        na.push(user.name)
        end
        series << Prawn::Graph::Series.new(ar,  title: "Lineas", type: :line, mark_average: true, mark_minimum: false)
        series << Prawn::Graph::Series.new(ar,  title: "Barras", type: :bar, mark_average: true, mark_minimum: false)
        graph series, width: 500, height: 200, title: "Products report", at: [20,400], xaxis_labels: na
        
    end
    
    def user_data
        text "Report rating Products " 
        move_down 20
        table user_data_all
    end
    
    def user_data_all
        [["Name", "Qualification"]] +
        @user.map do |user|
        [user.name,user.qualification]
        end
    end
end