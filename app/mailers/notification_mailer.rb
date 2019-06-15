class NotificationMailer < ApplicationMailer
    def new_product(user , product)
        @user = user
        @product = product
        mail(to: user.email, subject: 'New products added')
    end
end
