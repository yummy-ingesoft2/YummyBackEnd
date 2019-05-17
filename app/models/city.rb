class City < ApplicationRecord
    has_many :cooks
    has_many :clients
end
