# == Schema Information
#
# Table name: cooks
#
#  id         :integer          not null, primary key
#  address    :string
#  auth_token :string
#  birthdate  :date
#  email      :string
#  gender     :string
#  last_name  :string
#  latitude   :string
#  longitude  :string
#  name       :string
#  password   :string
#  state      :boolean
#  tel        :integer
#  user       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city_id    :integer
#
# Indexes
#
#  index_cooks_on_auth_token  (auth_token) UNIQUE
#  index_cooks_on_city_id     (city_id)
#

class Cook < ApplicationRecord
    has_many :products
    belongs_to :city
    validates :name, presence: true,length: { maximum: 45 }
    validates :last_name, presence: true,length: { maximum: 45 }
    validates :state, presence: true
    validates :tel, presence: true,length: { maximum: 15 }
    validates :email,presence: true,format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :latitude, presence: true,length: { maximum: 30 }
    validates :longitude, presence: true,length: { maximum: 30 }
    validates :address, presence: true,length: { maximum: 45 }
    validates :user, presence: true,length: { maximum: 15 }
    validates :password, presence: true,length: { maximum: 15 }
end
