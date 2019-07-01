class UsersdPdf < Prawn::Document
    #require 'squid'
    def initialize(user)
        super()
        series = []
        ar=[]
        na=[]
        @user = user
        user_data
        @user.map do |user|
        ar.push(user.Users)
        na.push(user.date.to_date.to_s)
        end
        series << Prawn::Graph::Series.new(ar,  title: "Another label", type: :line, mark_average: false, mark_minimum: false)
        graph series, width: 500, height: 200, title: "Users Report", at: [20,400], xaxis_labels: na
        
    end
    
    def user_data
        text "Report Users by date" 
        move_down 20
        table user_data_all
    end
    
    def user_data_all
        [["Date", "Users"]] +
        @user.map do |user|
        [user.date.to_date.to_s,user.Users]
        end
    end
end