class User_cSerializer < ActiveModel::Serializer
    attributes :city, :Users ,:date
def city
    self.object.city.name
end
def date
    self.object.created_at.to_date
end
  end