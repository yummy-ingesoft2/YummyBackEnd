# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  orderable_type :string
#  orderable_id   :integer
#  state          :boolean
#  quantity       :integer
#  cost           :integer
#  order_date     :date
#  client_id      :integer
#  product_id     :integer
#  driver_id      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Order < ApplicationRecord
    belongs_to :orderable , polymorphic: true
    validates :state, presence: true
    validates :quantity, presence: true,length: { maximum: 15 }
    validates :cost, presence: true
    validates :order_date, presence: true
end
