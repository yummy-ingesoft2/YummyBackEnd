class UsersPdf < Prawn::Document
    #require 'squid'
    def initialize(user)
        super()
        series = []
        ar=[]
        na=[]
        @user = user
        user_data
        @user.map do |user|
        ar.push(user.users)
        na.push(user.name)
        end
        series << Prawn::Graph::Series.new(ar,  title: "A label for a series", type: :bar)
        graph series, width: 500, height: 200, title: "Users Report", at: [20,300], xaxis_labels: na
        
    end
    
    def user_data
        text "Report User by city" 
        move_down 20
        table user_data_all
    end
    
    def user_data_all
        [["id","City", "Users"]] +
        @user.map do |user|
        [user.id,user.name,user.users]
        end
    end
end