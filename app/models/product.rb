# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  category    :string
#  cost        :integer
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cook_id     :integer
#
# Indexes
#
#  index_products_on_cook_id  (cook_id)
#

class Product < ApplicationRecord
    belongs_to :cook
    has_many :orders, as: :orderable
    has_many :reviews
    validates :name, presence: true,length: { maximum: 45 }
    validates :cost, presence: true
end
