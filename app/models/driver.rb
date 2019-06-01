# == Schema Information
#
# Table name: drivers
#
#  id              :integer          not null, primary key
#  auth_token      :string
#  email           :string
#  last_name       :string
#  name            :string
#  password_digest :string
#  user            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  city_id         :integer
#
# Indexes
#
#  index_drivers_on_auth_token  (auth_token) UNIQUE
#  index_drivers_on_city_id     (city_id)
#


class Driver < ApplicationRecord
    has_secure_password
    before_save   :downcase_email
    
    has_many :orders, as: :orderable
    belongs_to :city
    validates :user, presence: true ,length: { maximum: 15 }, uniqueness: { case_sensitive: false }
    validates :name, presence: true ,length: { maximum: 30 }
    validates :last_name, presence: true ,length: { maximum: 30 }
    validates :password, presence: true,length: { minimum: 5 }
    validates :email,presence: true,format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: false }
    def downcase_email
        self.email.downcase!
      end
end
