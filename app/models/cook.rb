# == Schema Information
#
# Table name: cooks
#
#  id         :integer          not null, primary key
#  name       :string
#  last_name  :string
#  state      :boolean
#  gender     :string
#  birthdate  :date
#  tel        :integer
#  email      :string
#  latitude   :string
#  longitude  :string
#  address    :string
#  user       :string
#  password   :string
#  city_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
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
