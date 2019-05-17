class Cook < ApplicationRecord
    has_many :products
    belongs_to :city
end
