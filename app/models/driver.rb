class Driver < ApplicationRecord
    has_many :orders, as: :orderable
    validates :user, presence: true ,length: { maximum: 15 }
    validates :password, presence: true,length: { maximum: 15 }
    validates :email,presence: true,format: { with: URI::MailTo::EMAIL_REGEXP } 
end
