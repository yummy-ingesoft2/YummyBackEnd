class DriverSerializer < ActiveModel::Serializer
  attributes :id ,:name, :user,:email
end
