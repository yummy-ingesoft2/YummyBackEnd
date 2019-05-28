# == Schema Information
#
# Table name: cooks
#
#  id         :integer          not null, primary key
#  address    :string
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
#  index_cooks_on_city_id  (city_id)
#

require 'test_helper'

class CookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
