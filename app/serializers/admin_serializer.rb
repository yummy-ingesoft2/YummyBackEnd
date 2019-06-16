# == Schema Information
#
# Table name: admins
#
#  id              :integer          not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class AdminSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
end
