class Driver < ApplicationRecord
    has_many :orders, as: :orderable
end
