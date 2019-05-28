# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  name       :string
#  last_name  :string
#  gender     :string
#  birthdate  :date
#  email      :string
#  latitude   :string
#  longitude  :string
#  address    :string
#  user       :string
#  password   :string
#  city_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
