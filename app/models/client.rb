class Client < ApplicationRecord
    belongs_to :city
    has_many :reviews
    has_many :orders
    validates :name, presence: true
    validates :last_name, presence: true
    validates :latitude, presence: true
    validates :longitude, presence: true
    validates :address, presence: true
    validates :user, presence: true
    validates :password, presence: true

end
