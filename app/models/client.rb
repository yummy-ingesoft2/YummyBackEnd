# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  name       :string
#  last_name  :string
#  gender     :string
#  birthdate  :date
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
