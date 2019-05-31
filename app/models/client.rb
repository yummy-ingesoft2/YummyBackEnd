# == Schema Information
#
# Table name: clients
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
#  user       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city_id    :integer
#
# Indexes
#
#  index_clients_on_auth_token  (auth_token) UNIQUE
#  index_clients_on_city_id     (city_id)
#

class Client < ApplicationRecord
    belongs_to :city
    has_many :reviews, as: :reviewable
    has_many :orders, as: :orderable
    validates :name, presence: true,length: { maximum: 45 }
    validates :last_name, presence: true,length: { maximum: 45}
    validates :latitude, presence: true,length: { maximum: 30 }
    validates :longitude, presence: true,length: { maximum: 30 }
    validates :address, presence: true,length: { maximum: 45 }
    validates :user, presence: true,length: { maximum: 15 }
    validates :password, presence: true,length: { maximum: 15 }
    validates :email,presence: true,format: { with: URI::MailTo::EMAIL_REGEXP } 
end
