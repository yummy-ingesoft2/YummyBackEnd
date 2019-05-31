# == Schema Information
#
# Table name: drivers
#
#  id         :integer          not null, primary key
#  auth_token :string
#  email      :string
#  last_name  :string
#  name       :string
#  password   :string
#  user       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_drivers_on_auth_token  (auth_token) UNIQUE
#

require 'test_helper'

class DriverTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
