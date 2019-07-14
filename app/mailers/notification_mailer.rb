class NotificationMailer < ApplicationMailer
    def new_product(user , product)
        @user = user
        @product = product
        mail(to: user.email, subject: 'New products added')
    end
    def new_comment(user,product,comment)
    @user = user
    @product = product
    @comment = comment
    mail(to: user.email, subject: 'New comment about '+product.name )
    end
    def new_order(user,order)
    @user = user
    @order = order
    mail(to: user.email, subject: 'New order' )
    end
end
