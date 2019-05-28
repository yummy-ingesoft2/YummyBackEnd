# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class City < ApplicationRecord
    validates :name, presence: true,length: { maximum: 45 }
    has_many :cooks
    has_many :clients
end
