class City < ApplicationRecord

    validates :name, presence: true
    has_many :cooks
    has_many :clients


end
