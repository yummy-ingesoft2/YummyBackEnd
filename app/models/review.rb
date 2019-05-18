class Review < ApplicationRecord
    belongs_to :product
    belongs_tp :client
    validates :qualification, presence: true
end
