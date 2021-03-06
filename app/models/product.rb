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
    has_many :orderproducts
    has_many :orders, through: :orderproducts
    has_many :reviews
    validates :name, presence: true,length: { maximum: 45 }
    validates :cost, presence: true
    
    def self.get_products_info(cook_id, page)
        self.where("cook_id = ?",cook_id).paginate(page: page, per_page: 10).pluck(:name,:cost,:id)
    end
    
    def self.get_product(cook_id, id)
        self.where("cook_id = ? and id = ?",cook_id, id)
    end

    def self.qualification(cook_id)
    self.joins(:reviews).where("cook_id = ?",cook_id).select("AVG(reviews.qualification) as qualification,products.*").group(:id)
    end
end
