# == Schema Information
#
# Table name: drivers
#
#  id         :integer          not null, primary key
#  user       :string
#  password   :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#  last_name  :string
#

require 'test_helper'

class DriverTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
