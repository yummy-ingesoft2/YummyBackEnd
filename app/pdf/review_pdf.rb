class ReviewPdf < Prawn::Document
    def initialize(review)
        super()
        @review = review
        review_number
        review_data
    end
    
    def review_number
        text "Review \##{@review.id}", size: 20
    end
    
    def review_data
        move_down 20
        table([ ["id del producto", "id del cliente","calificacion"],
        ["#{@review.product_id}", "#{@review.client_id}","#{@review.qualification}"] ]) do
        self.header = true
        self.row_colors = ["DDDDDD","FFFFFF"]
    end
    end
end