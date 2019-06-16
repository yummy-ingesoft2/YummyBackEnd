# == Schema Information
#
# Table name: admins
#
#  id              :integer          not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Admin < ApplicationRecord
    has_secure_password
    before_save   :downcase_email

    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z]+[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  
    validates :name,  presence: true
    validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :password,  presence: true, length: { minimum: 5 }, allow_nil: true
    def self.admin_default
        self.create(name:"admin",password:"123456",email:"admin@yummy.com")
    end
    private
        def downcase_email
        self.email.downcase!
      end
end
