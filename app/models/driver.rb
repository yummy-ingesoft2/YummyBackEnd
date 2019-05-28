# == Schema Information
#
# Table name: drivers
#
#  id         :integer          not null, primary key
#  user       :string
#  password   :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#  last_name  :string
#

class Driver < ApplicationRecord
    has_many :orders, as: :orderable
    validates :user, presence: true ,length: { maximum: 15 }
    validates :password, presence: true,length: { maximum: 15 }
    validates :email,presence: true,format: { with: URI::MailTo::EMAIL_REGEXP } 
end
