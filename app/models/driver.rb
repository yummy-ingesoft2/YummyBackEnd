# == Schema Information
#
# Table name: drivers
#
#  id              :integer          not null, primary key
#  email           :string
#  last_name       :string
#  name            :string
#  password_digest :string
#  picture         :string
#  user            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  city_id         :integer
#
# Indexes
#
#  index_drivers_on_city_id  (city_id)
#


class Driver < ApplicationRecord
    has_secure_password
    before_save   :downcase_email
    mount_uploader :picture, PictureUploader
    
    has_many :orders
    belongs_to :city
    validates :user, presence: true ,length: { maximum: 15 }, uniqueness: { case_sensitive: false }
    validates :name, presence: true ,length: { maximum: 30 }
    validates :last_name, presence: true ,length: { maximum: 30 }
    validates :password, presence: true,length: { minimum: 5 }
    validates :email,presence: true,format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: false }
    def downcase_email
        self.email.downcase!
    end
    
    def self.get_drivers_names(city_id, page)
        self.where("city_id = ?",city_id).paginate(page: page, per_page: 10).pluck(:name)
    end
    
    def self.get_driver(city_id, id)
        self.where("city_id = ? and id = ?",city_id, id)
    end
end
