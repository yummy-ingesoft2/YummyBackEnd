# == Schema Information
#
# Table name: clients
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
#  picture         :string
#  user            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  city_id         :integer
#
# Indexes
#
#  index_clients_on_city_id  (city_id)
#

class Client < ApplicationRecord
    has_secure_password
    before_save   :downcase_email
    
    mount_uploader :picture, PictureUploader
    belongs_to :city
    has_many :reviews
    has_many :orders
    validates :name, presence: true,length: { maximum: 45 }
    validates :last_name, presence: true,length: { maximum: 45}
    validates :latitude, presence: true,length: { maximum: 30 }
    validates :longitude, presence: true,length: { maximum: 30 }
    validates :address, presence: true,length: { maximum: 45 }
    validates :user, presence: true,length: { maximum: 15 }, uniqueness: { case_sensitive: false }
    validates :password, presence: true,length: { minimum: 5 }
    validates :email,presence: true,format: { with: URI::MailTo::EMAIL_REGEXP } , uniqueness: { case_sensitive: false }
    def downcase_email
        self.email.downcase!
    end
    
    def self.client_default
        self.create(name:"cook",last_name:"1",user:"cook",password:"123456",email:"cook@yummy.com",address:"kr 73 1",latitude:"4.710989",longitude:"-74.072090",city_id:1,picture:"https://yummy123.s3.amazonaws.com/perfil.jpg")
    end
    def self.get_clients_names(city_id, page)
        self.where("city_id = ?",city_id).paginate(page: page, per_page: 10).pluck(:name)
    end
    
    def self.get_client(city_id, id)
        self.where("city_id = ? and id = ?",city_id, id)
    end
end
