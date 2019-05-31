# == Schema Information
#
# Table name: drivers
#
#  id         :integer          not null, primary key
#  email      :string
#  last_name  :string
#  name       :string
#  password   :string
#  user       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city_id    :integer
#
# Indexes
#
#  index_drivers_on_city_id  (city_id)


class Driver < ApplicationRecord
    has_many :orders, as: :orderable
    belongs_to :city
    validates :user, presence: true ,length: { maximum: 15 }
    validates :name, presence: true ,length: { maximum: 30 }
    validates :last_name, presence: true ,length: { maximum: 30 }
    validates :password, presence: true,length: { maximum: 15 }
    validates :email,presence: true,format: { with: URI::MailTo::EMAIL_REGEXP }

end
