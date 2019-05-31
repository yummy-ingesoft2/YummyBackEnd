# == Schema Information
#
# Table name: drivers
#
#  id         :integer          not null, primary key
#  auth_token :string
#  email      :string
#  last_name  :string
#  name       :string
#  password   :string
#  user       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_drivers_on_auth_token  (auth_token) UNIQUE
#

class Driver < ApplicationRecord
    has_many :orders, as: :orderable
    validates :user, presence: true ,length: { maximum: 15 }
    validates :name, presence: true ,length: { maximum: 30 }
    validates :last_name, presence: true ,length: { maximum: 30 }
    validates :password, presence: true,length: { maximum: 15 }
    validates :email,presence: true,format: { with: URI::MailTo::EMAIL_REGEXP } 
end
