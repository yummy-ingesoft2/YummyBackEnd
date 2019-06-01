# == Schema Information
#
# Table name: cooks
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
#  state      :boolean
#  tel        :integer
#  user       :string 
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city_id    :integer
#
# Indexes
#
#  index_cooks_on_auth_token  (auth_token) UNIQUE
#  index_cooks_on_city_id     (city_id)
#


class CookSerializer < ActiveModel::Serializer
  attributes :email, :gender, :last_name, :name, :user
end
