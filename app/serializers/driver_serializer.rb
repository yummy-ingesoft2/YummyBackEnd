# == Schema Information
#
# Table name: drivers
#
#  id              :integer          not null, primary key
#  email           :string
#  last_name       :string
#  name            :string
#  password_digest :string
#  picture         :string
#  user            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  city_id         :integer
#
# Indexes
#
#  index_drivers_on_city_id  (city_id)
#

class DriverSerializer < ActiveModel::Serializer
  attributes :id ,:name,:user,:email
end
