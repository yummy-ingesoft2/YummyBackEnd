# == Schema Information
#
# Table name: cooks
#
#  id              :integer          not null, primary key
#  address         :string
#  birthdate       :date
#  email           :string
#  gender          :string
#  last_name       :string
#  latitude        :string
#  longitude       :string
#  name            :string
#  password_digest :string
#  state           :boolean
#  tel             :integer
#  user            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  city_id         :integer
#
# Indexes
#
#  index_cooks_on_city_id  (city_id)
#

class Cook < ApplicationRecord
    has_secure_password
    before_save   :downcase_email
    
    has_many :products
    belongs_to :city
    validates :name, presence: true,length: { maximum: 45 }
    validates :last_name, presence: true,length: { maximum: 45 }
    #validates :state, presence: true
    validates :tel, presence: true,length: { maximum: 15 }
    validates :email,presence: true,format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: false }
    validates :latitude, presence: true,length: { maximum: 30 }
    validates :longitude, presence: true,length: { maximum: 30 }
    validates :address, presence: true,length: { maximum: 45 }
    validates :user, presence: true,length: { maximum: 15 }, uniqueness: { case_sensitive: false }
    validates :password, presence: true,length: { minimum: 5 }
    def downcase_email
        self.email.downcase!
    end
    
    def self.get_cooks_names(city_id, page)
        self.where("city_id = ?",city_id).paginate(page: page, per_page: 10).pluck(:name)
    end
    
    def self.get_cook(city_id, id)
        self.where("city_id = ? and id = ?",city_id, id)
    end
    
    def self.get_products
        self.joins(:products).select('cooks.name, products.name as product_name')
    end
end
