class Cook < ApplicationRecord
    has_many :products
    belongs_to :city
    validates :name, presence: true
    validates :last_name, presence: true
    validates :state, presence: true
    validates :tel, presence: true
    validates :latitude, presence: true
    validates :longitude, presence: true
    validates :address, presence: true
    validates :user, presence: true
    validates :password, presence: true
end
