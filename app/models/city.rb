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
    has_many :drivers
    
    def self.get_cities_names(page)
        self.all.paginate(page: page, per_page: 5).pluck(:name)
    end
    def self.user_city()
        self.joins(:cooks).select("Count(cooks.id) as users,cities.id,cities.name").group(:id)
    end
end
