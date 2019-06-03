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
#  index_drivers_on_city_id  (city_id)
#

require 'test_helper'

class DriverTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
