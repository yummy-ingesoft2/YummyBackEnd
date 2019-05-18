class Cook < ApplicationRecord
    has_many :products
    belongs_to :city
    validates :name, presence: true,length: { maximum: 45 }
    validates :last_name, presence: true,length: { maximum: 45 }
    validates :state, presence: true
    validates :tel, presence: true,length: { maximum: 15 }
    validates :email,presence: true,format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :latitude, presence: true,length: { maximum: 30 }
    validates :longitude, presence: true,length: { maximum: 30 }
    validates :address, presence: true,length: { maximum: 45 }
    validates :user, presence: true,length: { maximum: 15 }
    validates :password, presence: true,length: { maximum: 15 }
end
