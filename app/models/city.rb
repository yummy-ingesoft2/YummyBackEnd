class City < ApplicationRecord
    validates :name, presence: true,length: { maximum: 45 }
    has_many :cooks
    has_many :clients
end
