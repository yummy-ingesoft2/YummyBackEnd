# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  category    :string
#  cost        :integer
#  description :text
#  name        :string
#  photos      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cook_id     :integer
#
# Indexes
#
#  index_products_on_cook_id  (cook_id)
#

class ProductSerializer < ActiveModel::Serializer
  attributes :category, :cost, :description, :name ,:photos
end
