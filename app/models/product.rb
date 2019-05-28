# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  category    :string
#  name        :string
#  description :text
#  cost        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cook_id     :integer
#

class Product < ApplicationRecord
    belongs_to :cook
    has_many :orders, as: :orderable
    has_many :reviews, as: :reviewable
    validates :name, presence: true,length: { maximum: 45 }
    validates :cost, presence: true
end
