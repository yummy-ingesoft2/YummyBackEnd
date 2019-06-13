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

class Product < ApplicationRecord
    mount_uploader :photos, PictureUploader
    belongs_to :cook
    has_many :orders, as: :orderable
    has_many :reviews
    validates :name, presence: true,length: { maximum: 45 }
    validates :cost, presence: true
    
    def self.get_products_info(cook_id, page)
        self.where("cook_id = ?",cook_id).paginate(page: page, per_page: 10).pluck(:name,:cost)
    end
    
    def self.get_product(cook_id, id)
        self.where("cook_id = ? and id = ?",cook_id, id)
    end
end
