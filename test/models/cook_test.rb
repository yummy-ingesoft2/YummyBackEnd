# == Schema Information
#
# Table name: cooks
#
#  id         :integer          not null, primary key
#  name       :string
#  last_name  :string
#  state      :boolean
#  gender     :string
#  birthdate  :date
#  tel        :integer
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

class CookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
